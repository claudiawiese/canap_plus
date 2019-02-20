# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


user1 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: Faker::Internet.password,
  email: Faker::Internet.email,
  nickname: Faker::Internet.username(8),
  phone: Faker::PhoneNumber.phone_number,
  team: Faker::Football.team,
  bio: Faker::GreekPhilosophers.quote,
  birthday: Faker::Date.between(80.years.ago, 16.years.ago)
  )


user2 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: Faker::Internet.password,
  email: Faker::Internet.email,
  nickname: Faker::Internet.username(8),
  phone: Faker::PhoneNumber.phone_number,
  team: Faker::Football.team,
  bio: Faker::GreekPhilosophers.quote,
  birthday: Faker::Date.between(80.years.ago, 16.years.ago)
  )


user3 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: Faker::Internet.password,
  email: Faker::Internet.email,
  nickname: Faker::Internet.username(8),
  phone: Faker::PhoneNumber.phone_number,
  team: Faker::Football.team,
  bio: Faker::GreekPhilosophers.quote,
  birthday: Faker::Date.between(80.years.ago, 16.years.ago)
  )

user4 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: Faker::Internet.password,
  email: Faker::Internet.email,
  nickname: Faker::Internet.username(8),
  phone: Faker::PhoneNumber.phone_number,
  team: Faker::Football.team,
  bio: Faker::GreekPhilosophers.quote,
  birthday: Faker::Date.between(80.years.ago, 16.years.ago)
  )

user5 = User.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  password: Faker::Internet.password,
  email: Faker::Internet.email,
  nickname: Faker::Internet.username(8),
  phone: Faker::PhoneNumber.phone_number,
  team: Faker::Football.team,
  bio: Faker::GreekPhilosophers.quote,
  birthday: Faker::Date.between(80.years.ago, 16.years.ago)
  )

event1 = Event.create!(
  game: "#{Faker::Football.team} - #{Faker::Football.team}",
  date: Faker::Date.forward(23),
  description: Faker::Lorem.paragraph,
  address: Faker::Address.street_address,
  capacity: rand(1..10),
  fee: "10 euros",
  user: user1
  )

event2 = Event.create!(
  game: "#{Faker::Football.team} - #{Faker::Football.team}",
  date: Faker::Date.forward(23),
  description: Faker::Lorem.paragraph,
  address: Faker::Address.street_address,
  capacity: rand(1..10),
  fee: "8 euros",
  user: user2
  )

event3 = Event.create!(
  game: "#{Faker::Football.team} - #{Faker::Football.team}",
  date: Faker::Date.forward(23),
  description: Faker::Lorem.paragraph,
  address: Faker::Address.street_address,
  capacity: rand(1..10),
  fee: "15 euros",
  user: user3
  )

reservation1 = Reservation.create!(
  quantity: 1,
  event: event1,
  user: user4
  )

reservation2 = Reservation.create!(
  quantity: 1,
  event: event2,
  user: user5
  )



