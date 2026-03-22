require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      booking = build(:booking)
      expect(booking).to be_valid
    end

    it "is not valid without an email" do
      booking = build(:booking, email: nil)
      expect(booking).not_to be_valid
    end

    it "is not valid with an invalid email format" do
      booking = build(:booking, email: "invalid_email")
      expect(booking).not_to be_valid
    end

    it "is not valid without a first name" do
      booking = build(:booking, first_name: nil)
      expect(booking).not_to be_valid
    end

    it "is not valid without a last name" do
      booking = build(:booking, last_name: nil)
      expect(booking).not_to be_valid
    end

    it "is not valid without a mobile number" do
      booking = build(:booking, mobile: nil)
      expect(booking).not_to be_valid
    end

    it "is not valid with a duplicate availability_id" do
      availability = create(:availability)
      create(:booking, availability: availability)
      duplicate_booking = build(:booking, availability: availability)
      expect(duplicate_booking).not_to be_valid
    end
  end

  describe "#full_name" do
    it "returns the full name of the booking" do
      booking = build(:booking, first_name: "John", last_name: "Doe")
      expect(booking.full_name).to eq("John Doe")
    end
  end

  describe "#mark_availability_as_booked" do
    it "marks the associated availability as booked when the booking is saved" do
      availability = create(:availability)
      booking = build(:booking, availability: availability)

      expect {
        booking.save
        availability.reload
      }.to change { availability.status }.from("available").to("booked")
    end
  end
end
