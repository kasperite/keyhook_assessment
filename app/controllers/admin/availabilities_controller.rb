class Admin::AvailabilitiesController < Admin::BaseController
  def index
    @listing = Listing.find(params[:listing_id])
    @date = params[:date].to_date
    @availabilities = @listing.availabilities.where(start_time: @date.all_day)
    @appointments = @listing.availabilities.booked.includes(:booking, :listing).where(start_time: @date.all_day)
  end
end
