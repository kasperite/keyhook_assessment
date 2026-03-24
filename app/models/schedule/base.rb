module Schedule
  class Base
    include ActiveModel::Model

    # Hardcoded operation hours for simplicity. In a real application, this could be set per user setting or app setting.
    OPERATION_HOURS = "09:00"..."17:00".freeze

    attr_accessor :start_time, :duration, :listing_id

    validates :start_time, :duration, :listing_id, presence: true
    validates :start_time, comparison: { greater_than: -> { Time.current }, message: "must be in the future" }
    validates :duration, numericality: { greater_than_or_equal_to: 30, message: "must be at least 30 minutes" }
    validate :within_operation_hours

    def initialize(attributes = {})
      @start_time = attributes[:start_time]
      @duration = attributes[:duration].to_i
      @listing_id = attributes[:listing_id]
    end

    def create
      raise NotImplementedError, "Subclasses must implement the create method"
    end

    def within_operation_hours
      return if start_time.nil? || duration.nil?
      end_time = start_time + duration.minutes

      unless OPERATION_HOURS.cover?(start_time.strftime("%H:%M")) && OPERATION_HOURS.cover?(end_time.strftime("%H:%M"))
        errors.add(:base, "All bookings must be within operation hours (9:00 AM to 5:00 PM)")
      end
    end
  end
end