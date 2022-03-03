# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

p "Deleting previous data..."
# destroy data
User.destroy_all if Rails.env == 'development'
Pet.destroy_all if Rails.env == 'development'

p "Seeding data.."

# add user data
5.times do
  User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'password'
  )
end

p "Created #{User.count} users..."

require "open-uri"

3.times do
  file = URI.open('https://source.unsplash.com/random/?dog')
  pet = Pet.new(
    location: Faker::Address.city,
    price: rand(10...100),
    description: Faker::Food.description,
    user_id: rand(71..75),
    category: "Dogs",
    name: Faker::Artist.name
  )
  pet.photos.attach(io: file, filename: 'dog.png', content_type: 'image/png')
  pet.save
end

3.times do
  file = URI.open('https://source.unsplash.com/random/?cat')
  pet = Pet.new(
    location: Faker::Address.city,
    price: rand(10...100),
    description: Faker::Food.description,
    user_id: rand(71..75),
    category: "Cats",
    name: Faker::Artist.name
  )
  pet.photos.attach(io: file, filename: 'cat.png', content_type: 'image/png')
  pet.save
end

3.times do
  file = URI.open('https://source.unsplash.com/random/?fish')
  pet = Pet.new(
    location: Faker::Address.city,
    price: rand(10...100),
    description: Faker::Food.description,
    user_id: rand(71..75),
    category: "Fish",
    name: Faker::Artist.name
  )
  pet.photos.attach(io: file, filename: 'fish.png', content_type: 'image/png')
  pet.save
end

3.times do
  file = URI.open('https://source.unsplash.com/random/?reptile')
  pet = Pet.new(
    location: Faker::Address.city,
    price: rand(10...100),
    description: Faker::Food.description,
    user_id: rand(71..75),
    category: "Reptiles",
    name: Faker::Artist.name
  )
  pet.photos.attach(io: file, filename: 'reptile.png', content_type: 'image/png')
  pet.save
end

3.times do
  file = URI.open('https://source.unsplash.com/random/?bird')
  pet = Pet.new(
    location: Faker::Address.city,
    price: rand(10...100),
    description: Faker::Food.description,
    user_id: rand(71..75),
    category: "Birds",
    name: Faker::Artist.name,
    latitude: rand(-90..90),
    longitude: rand(-180..180)
  )
  pet.photos.attach(io: file, filename: 'bird.png', content_type: 'image/png')
  pet.save
end



# add pet data
# 150.times do
#   Pet.create(
#     location: Faker::Address.city,
#     price: rand(10...100),
#     description: Faker::Food.description,
#     user_id: rand(7..26),
#     category: ['Dogs', 'Cats', 'Fish', 'Reptiles', 'Birds'].sample,
#     name: Faker::Artist.name
#   )
# end

p "Created #{Pet.count} pets.."
