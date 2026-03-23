FactoryBot.define do
  factory :availability do
    start_time { 1.day.from_now.change(hour: 10, min: 0) }
    end_time { 1.day.from_now.change(hour: 11, min: 0) }
    status { :available }
    association :listing
  end
end
