class CreateMovieImports < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_imports do |t|
      t.string :status, default: 'pending'
      t.string :file_name
      t.integer :total_rows, default: 0
      t.integer :processed_rows, default: 0
      t.text :errors
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    
    add_index :movie_imports, :status
  end
end
