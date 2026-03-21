module Schedule
  class Base
    include ActiveModel::Model

    attr_accessor :start_time, :duration, :user_id

    validates :start_time, :duration, :user_id, presence: true
    validates :duration, numericality: { greater_than_or_equal_to: 30 }

    def initialize(attributes = {})
      @start_time = attributes[:start_time]
      @duration = attributes[:duration]
      @user_id = attributes[:user_id]
    end

    def create
      raise NotImplementedError, "Subclasses must implement the create method"
    end
  end
end