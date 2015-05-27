15.times do |n|
  number = n.to_s
  User.create(
    name: Faker::Name.first_name + number,
    password: 'pw' + number,
    is_teacher: rand < 0.2
  )
end
