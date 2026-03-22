class Admin::AvailabilitiesController < Admin::BaseController
  def index
    @user = User.find(params[:user_id])
    @date = params[:date].to_date
    @availabilities = @user.availabilities.available.where(start_time: @date.all_day)
    @appointments = @user.availabilities.booked.includes(:booking).where(start_time: @date.all_day)
  end
end
