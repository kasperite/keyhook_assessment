class Admin::BookingsController < Admin::BaseController
  def show
    @date = params[:date].to_date
    @booking = Booking.find(params[:id])
  end
end
