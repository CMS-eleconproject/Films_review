# app/models/film.rb
class Film < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :release_date, presence: true
  validates :director, presence: true
  validates :poster_url, presence: true
  validates :description, presence: true
end
