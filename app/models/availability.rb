class Availability < ApplicationRecord
  belongs_to :listing
  has_one :booking, dependent: :destroy

  enum :status, [:available, :booked], default: :available

  validates_presence_of :start_time, :end_time, :status
  validate :end_time_after_start_time

  scope :upcoming_bookings, -> { where("start_time >= ?", Time.current).booked }

  def display_for_tenant
    "#{start_time.strftime("%B %d, %Y %H:%M")} - #{end_time.strftime("%H:%M")}"
  end
  
  private

  def end_time_after_start_time
    if end_time && start_time && end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
end
