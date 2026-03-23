class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :availabilities, through: :listings, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
