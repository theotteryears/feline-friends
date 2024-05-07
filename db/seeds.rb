puts "Cleaning database..."

User.destroy_all
Cat.destroy_all
Match.destroy_all

puts 'Creating users'

User.create!(email: "sitter@test.com", password: "123456", first_name: "Cat", last_name: "Sitter", role: 0)
User.create!(email: "owner@test.com", password: "123456", first_name: "Cat", last_name: "Owner", role: 1)

puts 'Creating cats'

Cat.create!(user_id: 2, name: "Kitty", details: "Cute")
Cat.create!(user_id: 2, name: "Bruno", details: "Full of rage")

puts 'Creating matches'

Match.create!(user_id: 1, cat_id: 1)
Match.create!(user_id: 1, cat_id: 2)

puts 'Finished seeding'
