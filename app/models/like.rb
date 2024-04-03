class Like < ApplicationRecord
  belongs_to :user # A like belongs to one user
  belongs_to :film # A like belongs to one film

  validates :user_id, uniqueness: { scope: :film_id } # Ensures a user can only like a film once
end