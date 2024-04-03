class AddColumnsToFilms < ActiveRecord::Migration[7.1]
  def change
    add_column :films, :director, :string
    add_column :films, :poster_url, :string
    add_column :films, :description, :text
  end
end
