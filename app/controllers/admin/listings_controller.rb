class Admin::ListingsController < Admin::BaseController
  def calendar
    @listing = Listing.find(params[:id])
    start_date = params.fetch(:start_date, Date.today).to_date
    @availabilities = Availability.includes(:listing).where(
      start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week,
      listing: params[:id]
    )
  end
  
  def index
    @listings = Listing.includes(availabilities: [:booking]).where(user: current_user)
  end
end
