FactoryBot.define do
  factory :listing do
    title { "Big House" }
    description { "Something here" }
    address { "Full Address" }
    photo { "house_1.jpg" }
    association :user
  end
end
