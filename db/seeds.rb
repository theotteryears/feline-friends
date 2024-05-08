require "open-uri"

puts "Cleaning database..."

User.destroy_all
Cat.destroy_all
Match.destroy_all

puts 'Creating users'

User.create!(email: "sitter@test.com", password: "123456", first_name: "Cat", last_name: "Sitter", details: "Hi, I am a cat sitter and I love cats")
User.create!(email: "owner@test.com", password: "123456", first_name: "Cat", last_name: "Owner", details: "Hi, I am a cat owner and I really need to find a cat sitter")

puts 'Creating cats'

# Cat.create!(user_id: 2, name: "George", details: "Cute", img_1: "/app/assets/images/george.jpg")
# Cat.create!(user_id: 2, name: "Leia", details: "Shy but sweet", img_1: "/app/assets/images/leia.jpg")

cat = Cat.new(user_id: 2, name: "George", details: "Cute", img_1: "george.jpg")
file = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715159584/george.jpg")
cat.img_1.attach(io: file, filename: "george.jpg", content_type: "image/jpg")
cat.save

# cat = Cat.new(user_id: 2, name: "Siva", details: "Floofy")
# file = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715161751/Siva.heic")
# cat.img_1.attach(io: file, filename: "Siva.heic", content_type: "image/heic")
# cat.save

cat = Cat.new(user_id: 2, name: "Leia", details: "Shy but sweet", img_1: "leia.jpg")
file = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715162028/leia.jpg")
cat.img_1.attach(io: file, filename: "leia.jpg", content_type: "image/jpg")
cat.save

# puts 'Creating matches'

# Match.create!(user_id: 1, cat_id: 1)
# Match.create!(user_id: 1, cat_id: 2)

puts 'Finished seeding'
