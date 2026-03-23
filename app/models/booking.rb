class Booking < ApplicationRecord
  belongs_to :availability
  delegate :listing, to: :availability

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, :last_name, :mobile, presence: true
  validates :availability_id, uniqueness: true

  def save(*args)
    super(*args).tap do |success|
      mark_availability_as_booked if success
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def mark_availability_as_booked
    availability.update(status: :booked)
  end
end
