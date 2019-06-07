FactoryBot.define do
  factory :event do
    game { Faker::Football.team }
    description { Faker::Lorem.paragraph }
    date { Faker::Date.forward(23) }
    capacity { 10 }
    address { Faker::Address.street_address }
    fee { '10' }
    association :user
  end
end
