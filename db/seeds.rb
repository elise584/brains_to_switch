# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Creating 100 fake brains...'

elise = User.new(first_name: "elise", last_name: "ddlt", email: "elise.dindault@gmail.com", password: "123456!")
elise.save!

10.times do
  brain = Brain.new(
    name: Faker::Science.scientist,
    category: "science",
    description: "a very scientific brain",
    price:  rand(20..100),
    user_id: elise.id
  )
  brain.save!
end

10.times do
  brain = Brain.new(
    name: Faker::GreekPhilosophers.name,
    category: "philosophy",
    description: "a very philosophic brain",
    price:  rand(20..100),
    user_id: elise.id
  )
  brain.save!
end

puts 'Finished!'
