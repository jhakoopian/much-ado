User.create!(
  email:    'admin@much-ado.com',
  password: 'password',
)

User.create!(
  email:    'user@much-ado.com',
  password: 'password',
)
users = User.all

10.times do
  Item.create!(
    user: users.sample,
    name: Faker::Hacker.say_something_smart,
  )
end
items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} to-do items created"
