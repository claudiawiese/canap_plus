FactoryBot.define do
  factory :reservation do
    quantity { 3 }
    user_id { 1 }
    event_id { 1 }
    association :event
    association :user
  end
end
