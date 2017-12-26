# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
  blog = Blog.create!(
               title: "test",
               content: "test",
               )
  #blog.user_id = "1"
end


10.times do |n|
  email = Faker::Internet.email
  password = "password"
  user.skip_confirmation!
  user = User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: "hogehgoe",
               uid: SecureRandom.hex(10),
               )
end
