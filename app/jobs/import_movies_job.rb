require 'csv'

class ImportMoviesJob < ApplicationJob
  queue_as :default

  def perform(movie_import_id)
    movie_import = MovieImport.find(movie_import_id)
    movie_import.update(status: 'processing')

    errors = []
    processed = 0

    begin
      csv_data = movie_import.csv_file.download
      csv = CSV.parse(csv_data, headers: true, header_converters: :symbol)
      movie_import.update(total_rows: csv.count)

      csv.each_with_index do |row, index|
        begin
          clean_row = row.to_h.transform_keys { |k| k.to_s.strip.to_sym }

          movie = movie_import.user.movies.build(
            title: clean_row[:title]&.strip,
            synopsis: clean_row[:synopsis]&.strip,
            year: clean_row[:year]&.to_i,
            duration: clean_row[:duration]&.to_i,
            director: clean_row[:director]&.strip
          )

          if clean_row[:categories].present?
            category_names = clean_row[:categories].split(',').map(&:strip)
            category_names.each do |name|
              category = Category.find_or_create_by(name: name)
              movie.categories << category unless movie.categories.include?(category)
            end
          end

          if movie.save
            processed += 1
          else
            errors << "Linha #{index + 2}: #{movie.errors.full_messages.join(', ')}"
          end

          movie_import.update(processed_rows: processed)
        rescue StandardError => e
          errors << "Linha #{index + 2}: #{e.message}"
        end
      end

      movie_import.update(
        status: 'completed',
        import_errors: errors.join("\n")
      )

    rescue StandardError => e
      movie_import.update(
        status: 'failed',
        import_errors: "Erro ao processar CSV: #{e.message}"
      )
    end
  end
end
