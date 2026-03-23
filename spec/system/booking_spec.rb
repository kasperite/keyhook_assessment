require 'rails_helper'

RSpec.describe 'Booking page', type: :system do
  it 'displays the booking page, then redirect to home page after successful submission' do
    availabilty = create(:availability)
    visit new_listing_bookings_path(availabilty.listing)
    expect(page).to have_content('Book a Viewing')
    expect(page).to have_select('booking_availability_id', with_options: ["#{availabilty.display_for_tenant}"])

    select(availabilty.display_for_tenant, from: 'booking_availability_id')

    fill_in 'booking_first_name', with: 'John'
    fill_in 'booking_last_name', with: 'Doe'
    fill_in 'booking_mobile', with: '012345678'
    fill_in 'booking_email', with: 'john.doe@example.com'

    click_button 'Create'
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Booking was successfully created.')
  end

  it 'displays error when there are no availabilities' do
    listing = create(:listing)
    visit new_listing_bookings_path(listing)
    expect(page).to have_content('There are no booking times currently available.')
    expect(page).to have_select('booking_availability_id', with_options: [])
  end
end