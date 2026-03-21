class Availability < ApplicationRecord
  belongs_to :user

  enum :status, [:available, :booked], default: :available

  validates_presence_of :start_time, :end_time, :status
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    if end_time && start_time && end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end
