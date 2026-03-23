class Listing < ApplicationRecord
  has_many :availabilities, dependent: :destroy
  has_many :bookings, through: :availabilities
  belongs_to :user
end
