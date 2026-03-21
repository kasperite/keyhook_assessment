class Admin::DashboardController < Admin::BaseController
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @availabilities = Availability.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end
end
