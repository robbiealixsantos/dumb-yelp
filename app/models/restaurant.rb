class Restaurant < ApplicationRecord
  validates :name, :cuisine, :address, :city, :state, :zip_code, presence: true

  belongs_to :user
  has_many :reviews

  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end
end
