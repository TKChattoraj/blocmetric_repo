# Create users
11.times do
  user = User.new(
    username: Faker::Internet.user_name,
    email:  Faker::Internet.email,
    password: "hello_world",
    password_confirmation: "hello_world"
  )
  user.confirm!
  user.save
end
pete = User.new(
    username: "CharlieHustle",
    email: "pete@rose.com",
    password: "hello_world",
    password_confirmation: "hello_world"
)
pete.confirm!
pete.save

users = User.all

79.times do
  app = App.create!(
    name:  Faker::App.name,
    #url: "http://#{Faker::Internet.domain_word}.#{Faker::Internet.domain_suffix}",
    url:  "http://#{Faker::Internet.domain_word}.com",
    user_id: users.sample.id
  )
end
apps = App.all
puts apps

event_names = ["event1", "event2", "event3", "event4", "event5", "event6"]
10001.times do
  event = Event.new(
    name: event_names.sample,
    app_id: apps.sample.id
  )
  event.save
end

puts "Seed Finished."
puts "#{User.count} users created."
puts "#{App.count} apps created."
puts "#{Event.count} events created."
