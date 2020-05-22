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
Category.destroy_all

puts 'Creating 4 categories...'
cat_science = Category.create(name: "science")
cat_philo = Category.create(name: "philosophy")
cat_sport = Category.create(name: "sport")
cat_litterature = Category.create(name: "litterature")

puts 'Creating 2 users...'

elise = User.new(first_name: "elise", last_name: "ddlt", email: "elise.dindault@gmail.com", password: "123456!")
elise.save!

yannis = User.new(first_name: "yannis", last_name: "bou", email: "yannis.bouhamou@hotmail.fr", password: "123456!")
yannis.save!

puts 'Creating 10 fake brains...'

addresses = ["12 place Panthéon, Paris",
  "5 rue Thomas Mann, Paris",
  "12 rue de l’Ecole de Médecine, Paris",
  "200, Avenue de la République, Nanterre",
  "Boulevard François Mitterrand, Evry",
  "21 rue de l’Ecole de médecine, Paris"]

  brain1 = Brain.new(
    name: "Stephen Hawking",
    category: cat_science,
    description: "cosmologist, space traveller and hero.",
    price:  rand(20..100),
    user: yannis,
    address: addresses.sample
  )
  brain1.save!

  brain2 = Brain.new(
    name: "William Shakespeare",
    category: cat_litterature,
    description: "English poet, playwright, and actor, widely regarded as the greatest writer in the English language and the world's greatest dramatist.",
    price:  rand(20..100),
    user: yannis,
    address: addresses.sample
  )
  brain2.save!

  brain3 = Brain.new(
    name: "Zinedine Zidane",
    category: cat_sport,
    description: "Well-known French footballer.",
    price:  rand(20..100),
    user: elise,
    address: addresses.sample
  )
  brain3.save!

  brain4 = Brain.new(
    name: "Voltaire",
    category: cat_philo,
    description: "French Enlightenment writer, historian, and philosopher.",
    price:  rand(20..100),
    user: yannis,
    address: addresses.sample
  )
  brain4.save!

    brain5 = Brain.new(
    name: "Albert Einstein",
    category: cat_science,
    description: "German-born theoretical physicist, who developed the theory of relativity, one of the two pillars of modern physics.",
    price:  rand(20..100),
    user: yannis,
    address: addresses.sample
  )
  brain5.save!

  brain6 = Brain.new(
    name: "Jane Austen",
    category: cat_litterature,
    description: "English novelist known primarily for her six major novels, which interpret, critique and comment upon the British landed gentry at the end of the 18th century.",
    price:  rand(20..100),
    user: yannis,
    address: addresses.sample
  )
  brain6.save!

  brain7 = Brain.new(
    name: "Rafael Nadal",
    category: cat_sport,
    description: "Spanish professional tennis player currently ranked world No. 2 in men's singles tennis by the Association of Tennis Professionals.",
    price:  rand(20..100),
    user: yannis,
    address: addresses.sample
  )
  brain7.save!

  brain8 = Brain.new(
    name: "Socrate",
    category: cat_philo,
    description: "French Enlightenment writer, historian, and philosopher.",
    price:  rand(20..100),
    user: yannis,
    address: addresses.sample
  )
  brain8.save!

  brain9 = Brain.new(
    name: "Yohann Aby",
    category: cat_sport,
    description: "French parachutist, world champion of Freestyle parachutism.",
    price:  rand(20..100),
    user: yannis,
    address: addresses.sample
  )
  brain9.save!

  brain10 = Brain.new(
    name: "Immanuel Kant",
    category: cat_philo,
    description: "German philosopher in the Age of Enlightenment.",
    price:  rand(20..100),
    user: yannis,
    address: addresses.sample
  )
  brain10.save!

puts 'Finished!'
