FactoryBot.define do
  factory :availability do
    start_time { "2026-03-18 19:32:36" }
    end_time { "2026-03-18 19:32:36" }
    status { :available }
    association :user
  end
end
