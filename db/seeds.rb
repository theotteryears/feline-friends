# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Cat.destroy_all
User.destroy_all
puts 'creating users'
User.create!(email: "admin@felinefriend.com", password: "123456", first_name: "Admin", last_name: "Admin")
puts 'creating cats'
Cat.create!(user_id: 1, name: "Kitty", details: "cute")
puts 'creating matches'
Match.create!(user_id: 1, cat_id: 1)
puts 'finished seeding'
