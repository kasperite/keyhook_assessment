require 'rails_helper'

RSpec.describe Schedule::Single, type: :model do
  let(:listing) { create(:listing) }
  let(:start_time) { 1.day.from_now.change(hour: 10, min: 0) }
  let(:duration) { 60 } # 1 hour

  subject { described_class.new(listing_id: listing.id, start_time: start_time, duration: duration) }

  describe "#create" do
    it "creates a new availability" do
      expect { subject.create }.to change(Availability, :count).by(1)
      availability = Availability.last
      expect(availability.end_time).to eq(start_time + duration.minutes)
      expect(availability.listing_id).to eq(listing.id)
    end

    it "does not create an availability if it overlaps with an existing one" do
      create(:availability, listing: listing, start_time: start_time, end_time: start_time + duration.minutes)

      expect(subject.valid?).to be_falsey
      expect(subject.errors[:base]).to include("This schedule overlaps with an existing availability")
    end

    context "when the time is outside operation hours" do
      let(:start_time) { Time.current.change(hour: 8, min: 0) } # Before operation hours
      it "does not create an availability" do
        expect { subject.create }.not_to change(Availability, :count)
        expect(subject.errors[:base]).to include("All bookings must be within operation hours (9:00 AM to 5:00 PM)")
      end
    end

    context "when the start time is in the past" do
      let(:start_time) { 1.hour.ago }
      it "does not create an availability" do
        expect { subject.create }.not_to change(Availability, :count)
        expect(subject.errors[:start_time]).to include("must be in the future")
      end
    end

    context "when the viewing duration is less than 30 minutes" do
      let(:duration) { 29 }
      it "does not create an availability" do
        expect { subject.create }.not_to change(Availability, :count)
        expect(subject.errors[:duration]).to include("must be at least 30 minutes")
      end
    end
  end
end