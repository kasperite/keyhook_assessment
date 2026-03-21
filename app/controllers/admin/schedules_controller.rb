class Admin::SchedulesController < Admin::BaseController
  before_action :find_user

  def new
    @schedule = Schedule::OneOff.new(user_id: @user.id, start_time: params[:date], duration: nil)
    turbo_stream
  end

  def create
    params[:schedule].parse_time_select! :start_time 
    @schedule = Schedule::OneOff.new(user_id: @user.id, start_time: schedule_params[:start_time], duration: schedule_params[:duration].to_i)
    
    if @schedule.valid?
      @availability = @schedule.create
      turbo_stream
    else
      render :new, status: :unprocessable_content
    end
  end

  def schedule_params
    params.require(:schedule).permit(:start_time, :duration)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
