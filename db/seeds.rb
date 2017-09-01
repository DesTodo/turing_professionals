require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

3.times do
  Industry.create(name: Faker::Job.field)
end

3.times do
  Location.create(city: Faker::Address.city, state: Faker::Address.state_abbr)
end

2.times do |n|
  co = Company.create(name: Faker::Company.name, website: "google.com", image_url: Faker::Company.logo)
  co.industries << Industry.all[0..n+1]
  co.locations << Location.all[0..n+1]
end

3.times do |n|
  user = User.create(username: "username#{n}", password: "password")
  Workplace.create(user_id: user.id, company: Company.first, position: Faker::Job.title, status: 0)
end

2.times do |n|
  user = User.create(username: "username#{n}", password: "password")
  Workplace.create(user_id: user.id, company: Company.second, position: Faker::Job.title, status: 0)
end
