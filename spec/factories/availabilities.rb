FactoryBot.define do
  factory :availability do
    start_time { DateTime.now }
    end_time { DateTime.now + 1.hour }
    status { :available }
    association :user
  end
end
