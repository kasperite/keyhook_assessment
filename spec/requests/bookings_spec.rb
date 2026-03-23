require 'rails_helper'

RSpec.describe "Bookings", type: :request do

  describe "create a booking and redirect to the listing page" do
    let(:listing) { create(:listing) }
    let(:availability) { create(:availability, listing: listing) }
    let(:booking_params) do
      {
        booking: {
          first_name: "John",
          last_name: "Doe",
          mobile: "1234567890",
          email: "admin@local.com",
          message: "Looking forward to it!",
          sms_reminder: true,
          over_eighteen: true,
          availability_id: availability.id
        }
      }
    end

    it "creates a booking and redirects to the listing page" do
      post "/listings/#{listing.id}/bookings", params: booking_params
      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response).to have_http_status(:success)
      expect(flash[:notice]).to eq("Booking was successfully created.")
    end
  end

end
