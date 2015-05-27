15.times do |n|
  User.create(
    name: Faker::Name.first_name + Faker::Name.last_name,
    password: Faker::Internet.password,
    is_teacher: rand < 0.2
  )
end
