# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
user = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  nickname: Faker::JapaneseMedia::DragonBall.character,
  phone: Faker::PhoneNumber.phone_number,
  team: Faker::Football.team,
  bio: Faker::GreekPhilosophers.quote,
  birthday: Faker::Date.between(80.years.ago, 16.years.ago)
  )
end


