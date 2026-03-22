module AvailabilityHelper
  def display_timeslot(availability)
    "#{availability.start_time.strftime('%H:%M')} - #{availability.end_time.strftime('%H:%M')}"
  end
end
