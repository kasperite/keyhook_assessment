module Schedule
  class OneOff < Base
    validate :no_overlapping_availabilities

    def create
      Availability.create(
        start_time: start_time,
        end_time: start_time + duration.minutes,
        user_id: user_id,
      )
    end

    def no_overlapping_availabilities
      return unless start_time && duration && user_id

      end_time = start_time + duration.minutes
      overlapping = Availability.where(user_id: user_id)
                                .where("start_time < ? AND end_time > ?", end_time, start_time)

      if overlapping.exists?
        errors.add(:base, "This schedule overlaps with an existing availability")
      end
    end
  end
end