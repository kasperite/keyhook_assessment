# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
user = User.find_or_create_by!(email_address: "admin@localhost.com") do |user|
  user.password = "Password1234!"
  user.password_confirmation = "Password1234!"
end

unless Availability.exists?
  Availability.create!(
    start_time: DateTime.current,
    end_time: DateTime.current + 30.minutes,
    user: user
  )

  Availability.create!(
    start_time: 1.day.from_now,
    end_time: 1.day.from_now + 30.minutes,
    user: user
  )
end