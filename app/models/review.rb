class Review < ApplicationRecord
  validates :rating, presence: true
  validates :review, presence: true

  belongs_to :user
  belongs_to :restaurant
end
