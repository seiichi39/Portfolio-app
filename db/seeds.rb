# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "管理者",
            email: "sample@email.com",
            phone_number: "000-0000-9999",
            password: "password",
            password_confirmation: "password",
            admin: true)

20.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  phone_number = "000-0000-0#{n+1}"
  password = "password"
  User.create!(name: name,
              email: email,
              phone_number: phone_number,
              password: password,
              password_confirmation: password)
end

6.times do |n|
  name = "第#{n+1}テニスコート"
  Court.create!(court_name: name)
end