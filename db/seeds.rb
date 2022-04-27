# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |x|
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    is_admin: false
  )
end

15.times do |x|
  Region.create!(
    name: Faker::Address.city,
    lat: Faker::Address.latitude;
    lng: Faker::Address.longitude
  )
end

15.times do |x|
  Company.create!(
    name: Faker::Company.name,
    address: Faker::Address.street_address
    lat: Faker::Address.latitude;
    lng: Faker::Address.longitude
  )
end

10.times do |x|
  IndustryTaxonomy.create!(
    name: Faker::Company.industry
  )
end

10.times do |x|
  Material.create!(
    name: Faker::Construction.material
  )
end

10.times do |x|
  MachinesTaxonomy.create!(
    name: Faker::Appliance.equipment
  )
end

10.times do |x|
  ProcessTaxonomy.create!(
    name: Faker::Verb.ing_form
  )
end

10.times do |x|
  FinishedProductsTaxonomy.create!([
    { name: "Ancient techniques" },
    { name: "Family business" },
    { name: "Innovative production" },
    { name: "Family business" },
    { name: "One of a kind (bespoke)" },
    { name: "Vegan" },
    { name: "Woman owned-business" },
    { name: "Zero waste" }
  ])
end
