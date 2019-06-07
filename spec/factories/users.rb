FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    team { 'OM' }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    phone { Faker::PhoneNumber.phone_number }
    bio { Faker::Lorem.sentence }
  end

  factory :invalid_user do
    nickname { Faker::Name.first_name }
  end
end
