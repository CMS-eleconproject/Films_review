class CreateFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :films do |t|
      t.string :title
      t.date :release_date
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
