require "rails_helper"

RSpec.describe "Admin Bookings", type: :system do
  let(:availability) { create(:availability, status: :booked) }
  let(:booking) { create(:booking, availability: availability) }

  before do
    sign_in(booking.listing.user)
  end

  describe "Viewing Bookings" do
    it "displays all confirmed viewings" do
      visit admin_listing_bookings_path(booking.listing)

      expect(page).to have_content("Confirmed Viewings")
      expect(page).to have_content(booking.listing.address)
      expect(page).to have_content(booking.full_name)
      expect(page).to have_content(booking.mobile)
    end
  end
end