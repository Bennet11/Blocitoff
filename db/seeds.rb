5.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
end
users = User.all

50.times do
  Item.create!(
  user: users.sample,
  name: Faker::Lorem.sentence
  )
end
