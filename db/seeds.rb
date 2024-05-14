require "open-uri"
require "faker"

puts "Cleaning database..."

User.destroy_all
Cat.destroy_all
Match.destroy_all
Message.destroy_all
Chatroom.destroy_all

puts 'Creating users'

user1 = User.new(role: 0, email: "sitter@test.com", password: "123456", first_name: "Jessica", last_name: "Roche", city: "Brighton", details: "")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715718615/Sitter.jpg")
user1.img.attach(io: file, filename: "Sitter.jpg", content_type: "image/jpg")
user1.save

user2 = User.new(role: 1, email: "owner1@test.com", password: "123456", first_name: "Holly", last_name: "Clark", city: "London", details: "")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715718616/Owner1.jpg")
user2.img.attach(io: file, filename: "Owner1.jpg", content_type: "image/jpg")
user2.save

user3 = User.new(role: 1, email: "owner2@test.com", password: "123456", first_name: "Lauren", last_name: "Allard", city: "Paris", details: "")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715718613/Owner2.jpg")
user3.img.attach(io: file, filename: "Owner2.jpg", content_type: "image/jpg")
user3.save

puts 'Creating cats'

cat = Cat.new(user: user2, name: Faker::Creature::Cat.name, personality: "A fluffy charmer with a penchant for pilfering socks and turning retrieval missions into impromptu comedy shows. With a swagger in his step and mischief in his eyes, he's the purr-fect blend of quirky and cunning.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "London")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/1.jpg")
cat.img_1.attach(io: file, filename: "1.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Luna", personality: "Luna, our charismatic black cat, embodies boundless curiosity and playful mischief. From her gleaming emerald eyes to her affectionate purrs, she's a constant source of joy and adventure in our home.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Paris")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/1.jpg")
cat.img_1.attach(io: file, filename: "1.jpg", content_type: "image/jpg")
cat.save

puts 'Finished seeding'
