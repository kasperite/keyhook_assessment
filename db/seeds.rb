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

listing1 = Listing.find_or_create_by!(title: "Big House", user: user) do |listing|
  listing.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
  listing.address = "123 Main St, Anytown"
  listing.photo = "house_1.jpg"
  listing.user = user
end

listing2 = Listing.find_or_create_by!(title: "Another Big House", user: user) do |listing|
  listing.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
  listing.address = "456 Oak Ave, Funkytown"
  listing.photo = "house_2.jpg"
  listing.user = user
end

Availability.destroy_all


Availability.create!(
  start_time: 1.day.from_now.change(hour: 10, minute: 0),
  end_time: 1.day.from_now.change(hour: 11, minute: 0),
  listing: listing1
)

Availability.create!(
  start_time: 2.day.from_now.change(hour: 10, minute: 0),
  end_time: 2.day.from_now.change(hour: 11, minute: 0),
  listing: listing2
)
