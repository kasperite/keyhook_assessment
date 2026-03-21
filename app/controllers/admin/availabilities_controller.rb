class Admin::AvailabilitiesController < Admin::BaseController
  def new
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @date = params[:date].to_date
    @availabilities = @user.availabilities.where(start_time: @date.all_day)
  end
end
