class MovieImportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @movie_import = MovieImport.new
  end

  def create
    file_name = params[:movie_import][:file_name]
    csv_file = params[:movie_import][:csv_file]

    @movie_import = current_user.movie_imports.new
    @movie_import.file_name = file_name
    @movie_import.status = 'pending'
    @movie_import.csv_file.attach(csv_file)

    if @movie_import.save
      ImportMoviesJob.perform_later(@movie_import.id)
      redirect_to @movie_import, notice: '📤 Importação iniciada!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @movie_import = current_user.movie_imports.find(params[:id])
  end

  def status
    @movie_import = current_user.movie_imports.find(params[:id])
    render json: {
      status: @movie_import.status,
      total_rows: @movie_import.total_rows,
      processed_rows: @movie_import.processed_rows,
      import_errors: @movie_import.import_errors
    }
  end
end
