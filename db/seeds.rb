# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Dropping database...'
Brain.destroy_all
User.destroy_all

puts 'Creating 20 fake brains...'

addresses = ["12 place Panthéon, Paris",
  "5 rue Thomas Mann, Paris",
  "12 rue de l’Ecole de Médecine, Paris",
  "200, Avenue de la République, Nanterre",
  "Boulevard François Mitterrand, Evry",
  "21 rue de l’Ecole de médecine, Paris"]

elise = User.new(first_name: "elise", last_name: "ddlt", email: "elise.dindault@gmail.com", password: "123456!")
elise.save!

yannis = User.new(first_name: "yannis", last_name: "bou", email: "yannis.bouhamou@hotmail.fr", password: "123456!")
yannis.save!

10.times do
  brain = Brain.new(
    name: Faker::Science.scientist,
    category: "science",
    description: "a very scientific brain",
    price:  rand(20..100),
    user: elise,
    address: addresses.sample
  )
  brain.save!
end

10.times do
  brain = Brain.new(
    name: Faker::GreekPhilosophers.name,
    category: "philosophy",
    description: "a very philosophic brain",
    price:  rand(20..100),
    user: yannis,
    address: addresses.sample
  )
  brain.save!
end

puts 'Finished!'
