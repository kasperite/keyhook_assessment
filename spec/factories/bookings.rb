FactoryBot.define do
  factory :booking do
    first_name { "John" }
    last_name { "Doe" }
    mobile { "1234567890" }
    email { "john.doe@example.com" }
    message { "I am interested in viewing this property." }
    over_eighteen { true }
    association :availability
  end
end
