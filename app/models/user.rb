class User < ApplicationRecord
  # Include default devise modules (Others can be added as needed)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :films, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
