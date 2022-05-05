# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Dog.destroy_all
DogSitter.destroy_all 
Stroll.destroy_all
City.destroy_all

#création des villes
5.times do 
   City.create(
      city_name: Faker::Address.city,
   )
end

#création des dogs
13.times do 
   Dog.create(
     name: Faker::Games::Pokemon.name,
     city: City.all.sample
     )
end

# Création des dog-sitter
8.times do 
   DogSitter.create(
     name: Faker::Name.first_name,
     city: City.all.sample
     )
end

15.times do |n|
   Stroll.create(
      dog_sitter: DogSitter.all.sample,
      name: "promenade#{n}"
   )
end

2.times do 
   Stroll.all.each do |stroll|
      Join.create(
         dog: Dog.all.sample,
         dog_sitter: stroll.dog_sitter,
         stroll: stroll
      )
   end
end