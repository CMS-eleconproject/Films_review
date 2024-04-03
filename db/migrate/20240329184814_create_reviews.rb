class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :film, null: false, foreign_key: true

      t.timestamps
    end
  end
end
