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
20.times do
  User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: 'password'
  )
end

p "Created #{User.count} users..."

# add pet data
150.times do
  Pet.create(
    location: Faker::Address.city,
    price: rand(10...100),
    description: Faker::Food.description,
    user_id: rand(132..142),
    category: ['Dogs', 'Cats', 'Fish', 'Reptiles', 'Birds'].sample,
    name: Faker::Artist.name
  )
end

p "Created #{Pet.count} pets.."
