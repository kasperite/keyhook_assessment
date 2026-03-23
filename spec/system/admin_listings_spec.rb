require "rails_helper"

RSpec.describe "Admin Listings", type: :system do
  let!(:listing) { create(:listing, title: "Test Listing") }

  before do
    sign_in(listing.user)
  end

  describe "Viewing Listings" do
    it "displays the listing in the admin dashboard, clicks on the listing calendar to view its calendar" do
      visit admin_listings_path

      expect(page).to have_content("Test Listing")
      click_link "View Calendar"
      expect(page).to have_content(listing.address)
    end
  end
end