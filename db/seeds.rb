# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creates 2 users with random first name, last name and email
20.times do |x|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    is_admin: false
  )
end

5.times do |x|
  Region.create!(
    name: Faker::TvShows::GameOfThrones.unique.city
  )  
end

5.times do |x|
  IndustryTaxonomy.create!(
    name: Faker::IndustrySegments.sector
  )  
end

5.times do |x|
  Material.create!(
    name: Faker::Commerce.material
  )  
end

5.times do |x|
  MachinesTaxonomy.create!(
    name: Faker::Appliance.equipment
  )  
end

20.times do |x|
  Company.create!(
    name: Faker::Company.name,
    is_verified: true
  )
end

ProcessTaxonomy.create!([{
  name: "3D Printing"
},
{
  name: "CNC Milling"
},
{
  name: "Blacksmithing"
},
{
  name: "Ceramic"
},
{
  name: "Engraving"
}])

FinishedProductsTaxonomy.create!([{
  name: "Made circular"
},
{
  name: "Ancient techniques"
},
{
  name: "One of a kind (Bespoke)"
},
{
  name: "Innovative production"
},
{
  name: "Family Business"
},
{
  name: "Vegan"
},
{
  name: "Woman owned-business"
},
{
  name: "Zero Waste"
}])