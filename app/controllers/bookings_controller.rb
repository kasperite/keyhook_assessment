class BookingsController < ApplicationController
  def new
    @availabilities = Availability.available.where("start_time >= ?", Time.current)
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to root_path, notice: 'Booking was successfully created.'
    else
      @availabilities = Availability.available.where("start_time >= ?", Time.current)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :mobile, :email, :message, :sms_reminder, :over_eighteen, :availability_id)
  end
end
