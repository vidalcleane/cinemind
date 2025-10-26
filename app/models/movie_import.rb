class MovieImport < ApplicationRecord
  belongs_to :user
  has_one_attached :csv_file

  validates :file_name, presence: true

  def progress_percentage
    return 0 if total_rows.nil? || total_rows.zero?
    ((processed_rows.to_f / total_rows) * 100).round
  end
end
