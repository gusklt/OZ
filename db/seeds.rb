# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'csv'

Review.delete_all
if Review.count.zero?
  puts "All review have been destroy"
else
  puts "error deleting reviews"
end

Booking.delete_all
if Booking.count.zero?
  puts "All booking have been destroy"
else
  puts "error deleting bookings"
end

Performance.delete_all
if Performance.count.zero?
  puts "All Performance have been deleted"
else
  puts "error deleting performances"
end

User.delete_all
if User.count.zero?
  puts "All user have been destroy"
else
  puts "error deleting users"
end

user1 = User.create(
  email: 'test@test.fr',
  username: 'David_copperfield',
  password: '123456',
  password_confirmation: '123456'
)

user2 = User.create(
  email: 'test@poudlard.com',
  username: 'harryp',
  password: 'gryfondor',
  password_confirmation: 'gryfondor'
)

user3 = User.create(
  email: 'pheobe@charmed.com',
  username: 'pheobe',
  password: 'halliwell',
  password_confirmation: 'halliwell'
)

user4 = User.create(
  email: 'piper@charmed.com',
  username: 'piper',
  password: 'halliwell',
  password_confirmation: 'halliwell'
)

user5 = User.create(
  email: 'fakir@ava.com',
  username: 'fakir_of_ava',
  password: '123456',
  password_confirmation: '123456'
)
user6 = User.create(
  email: 'flom@justin.com',
  username: 'justin_flom',
  password: '123456',
  password_confirmation: '123456'
)
user7 = User.create(
  email: 'frank@garcia.com',
  username: 'frank_garcia',
  password: '123456',
  password_confirmation: '123456'
)
user8 = User.create(
  email: 'law@austin.com',
  username: 'austin.law',
  password: '123456',
  password_confirmation: '123456'
)
user9 = User.create(
  email: 'tina@lenert.com',
  username: 'tina',
  password: '123456',
  password_confirmation: '123456'
)
user10 = User.create(
  email: 'camile@fork.com',
  username: 'camile',
  password: '123456',
  password_confirmation: '123456'
)

if User.count == 10
  puts "10 users created"
else
  puts "error creating users"
end

users = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10]
performances = []
locations = ['155	Rue Commandant Caroline Aigle	13090	Aix-en-Provence', "7	Rue de l'Abbé Bremond	13090	Aix-en-Provence",
          "1 Rue Achille Emperaire	13090	Aix-en-Provence", "1	Rue des Alizés	13090	Aix-en-Provence",
          "6	Allée des Amandiers	13100	Aix-en-Provence", "8	Passage Agard	13100	Aix-en-Provence",
        "35	Chemin Albert Guigou	13290	Aix-en-Provence", "8	Traverse de l'Aigle d'Or	13100	Aix-en-Provence",
      "2	Place Aimé Gazel	13290	Aix-en-Provence", "2	Avenue Albert Baudoin	13090	Aix-en-Provence"]
n = 0
10.times do
  performance = Performance.new(
    title: Faker::Games::LeagueOfLegends.summoner_spell,
    description: Faker::Games::LeagueOfLegends.quote,
    location: locations[n],
    price: rand(50..250)
  )
  performance.user = users.sample
  performance.save
  performances << performance
  n += 1
end

if Performance.count == 10
  puts "10 performances created"
else
  puts "error creating performances"
end

booking1 = Booking.new(
  date: DateTime.now,
  status: ['accepted', 'pending', 'declined'].sample
)
booking1.user = user1
booking1.performance = performances.sample
booking1.save

booking2 = Booking.new(
  date: DateTime.now,
  status: ['accepted', 'pending', 'declined'].sample
)
booking2.user = user2
booking2.performance = performances.sample
booking2.save

booking3 = Booking.new(
  date: DateTime.now,
  status: ['accepted', 'pending', 'declined'].sample
)
booking3.user = user3
booking3.performance = performances.sample
booking3.save

booking4 = Booking.new(
  date: DateTime.now,
  status: ['accepted', 'pending', 'declined'].sample
)
booking4.user = user4
booking4.performance = performances.sample
booking4.save

if Booking.count == 4
  puts "4 bookings created"
else
  puts "error creating bookings"
end
