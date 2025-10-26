class RenameErrorsInMovieImports < ActiveRecord::Migration[7.1]
  def change
    rename_column :movie_imports, :errors, :import_errors
  end
end