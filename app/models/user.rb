class User < ApplicationRecord
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates_format_of :email, :with => /@/

  has_secure_password

  has_many :restaurants
  has_many :reviews
end
