class Review < ApplicationRecord
  validates :content, presence: true
  validates :rating, presence: true

  belongs_to :user # A review belongs to one user
  belongs_to :film # A review belongs to one film
end
