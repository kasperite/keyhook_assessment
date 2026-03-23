class Admin::BookingsController < Admin::BaseController
  def show
    @date = params[:date].to_date
    @booking = Booking.find(params[:id])
  end

  def index
    @listing = Listing.find(params[:listing_id])
    @bookings = @listing.availabilities.grouped_bookings_by_day
  end
end
