class Admin::SchedulesController < Admin::BaseController
  def new
    @schedule = Schedule::Single.new(listing_id: params[:listing_id], start_time: params[:date])
    turbo_stream
  end

  def create
    params[:schedule].parse_time_select! :start_time 
    @schedule = Schedule::Single.new(schedule_params)
    
    if @availability = @schedule.create
      turbo_stream
    else
      render :new, status: :unprocessable_content
    end
  end

  def schedule_params
    params.require(:schedule).permit(:start_time, :duration, :listing_id)
  end
end
