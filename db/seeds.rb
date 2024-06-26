require "open-uri"
require "faker"

puts "Cleaning database..."

User.destroy_all
Cat.destroy_all
Match.destroy_all
Message.destroy_all
Chatroom.destroy_all

puts 'Creating Cat Sitter'

user1 = User.new(role: 0, email: "sitter@test.com", password: "123456", first_name: "Sophie", last_name: "Smith", city: "Brighton", details: "I'm a cat lover who has been around cats my whole life. I have experience with all kinds of cats, from the shy and timid to the bold and adventurous. I'm patient, caring, and attentive, and I'll make sure your feline friend gets all the love and attention they need while you're away. I'm also happy to send you updates and photos so you can see how your cat is doing while you're gone. I look forward to meeting you and your furry friend!")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377070/sitter.jpg")
user1.img.attach(io: file, filename: "sitter.jpg", content_type: "image/jpg")
user1.save

puts 'Creating Cat Owner'

user2 = User.new(role: 1, email: "owner@test.com", password: "123456", first_name: "Holly", last_name: "Müller", city: "Zurich", details: "")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377084/owner.jpg")
user2.img.attach(io: file, filename: "owner.jpg", content_type: "image/jpg")
user2.save

puts 'Creating Cats'

cat = Cat.new(user: user2, name: "Milo", personality: "With fur as fluffy as a cloud and eyes that gleam like polished amber, Milo is our cuddly companion. Milo fills our home with warmth and love.", age: 1, breed: Faker::Creature::Cat.breed, address: "London")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377083/A.jpg")
cat.img_1.attach(io: file, filename: "A.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Luna", personality: "A sassy little diva with a penchant for lounging in sunbeams and demanding attention on her terms. She's a master of the art of the purr, and she's not afraid to use it to get what she wants.", age: 3, breed: Faker::Creature::Cat.breed, address: "Paris")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377087/B.jpg")
cat.img_1.attach(io: file, filename: "B.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "George", personality: "With fur as curly as a plate of spaghetti and eyes as wobbly as jelly, is our eccentric explorer. George's quirky charm and unorthodox methods keep us guessing at every turn.", age: Faker::Number.within(range: 1..10), breed: Faker::Creature::Cat.breed, address: "Coventry")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377086/C.jpg")
cat.img_1.attach(io: file, filename: "C.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Ponyo", personality: "With fur that defies gravity and eyes that seem to peer into other dimensions, this feline oddity is like a visitor from another planet. This cat's antics never fail to entertain.", age: 6, breed: Faker::Creature::Cat.breed, address: "Brighton")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377085/D.jpg")
cat.img_1.attach(io: file, filename: "D.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Sosuke", personality: "This enigmatic creature is a master of disguise, blending seamlessly into its surroundings like a chameleon in a rainbow factory.", age: Faker::Number.within(range: 1..10), breed: Faker::Creature::Cat.breed, address: "Hove")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377083/E.jpg")
cat.img_1.attach(io: file, filename: "E.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Sophie", personality: "Meet Sophie, the elegant queen of our household. Her fur, as sleek as satin, and eyes, as green as the forest, radiate grace and charm.", age: 5, breed: Faker::Creature::Cat.breed, address: "Altstetten, Zurich")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377081/F.jpg")
cat.img_1.attach(io: file, filename: "F.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Diego", personality: "Likes: Eating and sleeping - Dislikes: Being left alone for too long", age: 2, breed: Faker::Creature::Cat.breed, address: "Hardbrücke, Zurich")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377080/G.jpg")
cat.img_1.attach(io: file, filename: "G.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "David", personality: "Techno lover. Wow - this cat likes to party!", age: 4, breed: Faker::Creature::Cat.breed, address: "Enge, Zurich")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377070/H.jpg")
cat.img_1.attach(io: file, filename: "H.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Sir Pouncealot", personality: "He just will not stop jumping around. I hope you have some energy.", age: 1, breed: Faker::Creature::Cat.breed, address: "Wiedikon, Zurich")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377079/I.jpg")
cat.img_1.attach(io: file, filename: "I.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Lily", personality: "Lily, with fur as white as freshly fallen snow and eyes as bright as twinkling stars, is our little angel.", age: 3, breed: Faker::Creature::Cat.breed, address: "Wipkingen, Zurich")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377077/J.jpg")
cat.img_1.attach(io: file, filename: "J.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Jean-Claude", personality: "With a fur coat that rivals the fluffiness of a cumulus cloud and a penchant for avant-garde interpretive dance, this cat is a true eccentric.", age: 10, breed: Faker::Creature::Cat.breed, address: "Paris")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377076/K.jpg")
cat.img_1.attach(io: file, filename: "K.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Dareos", personality: "This mysterious feline luminary is a creature of the shadows, emerging from the depths of the wardrobe like a nocturnal ninja. This cat's clandestine activities and covert operations would put even the most seasoned spy to shame.", age: 2, breed: Faker::Creature::Cat.breed, address: "Aussersihl, Zurich")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377075/L.jpg")
cat.img_1.attach(io: file, filename: "L.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Kenneth", personality: "This curious creature is a veritable whirlwind of energy and enthusiasm, bouncing off the walls like a pinball in a funhouse. Kenneth's boundless energy and relentless curiosity know no bounds.", age: 2, breed: Faker::Creature::Cat.breed, address: "Barcelona")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377074/M.jpg")
cat.img_1.attach(io: file, filename: "M.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Siva", personality: "With fur as soft as a cloud and eyes that twinkle with mischief, this whimsical feline is a creature of pure delight. Siva's playful antics and fanciful adventures are a joy to behold.", age: 2, breed: Faker::Creature::Cat.breed, address: "Schauenbergstrasse 4, 8400 Winterthur")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377073/N.jpg")
cat.img_1.attach(io: file, filename: "N.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Rubine", personality: "This regal feline aristocrat is a creature of refinement and sophistication, conducting itself with the grace and elegance of a prima ballerina.", age: 1, breed: Faker::Creature::Cat.breed, address: "Schauenbergstrasse 6, 8400 Winterthur")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377072/O.jpg")
cat.img_1.attach(io: file, filename: "O.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Carlos", personality: "With fur as vibrant as a rainbow and eyes that shimmer like precious gemstones, this flamboyant feline is a true eccentric.", age: 6, breed: Faker::Creature::Cat.breed, address: "Salisbury Road, Hove")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377072/P.jpg")
cat.img_1.attach(io: file, filename: "P.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Flower", personality: "This mischievous little rascal is a master of disguise, donning elaborate costumes and assuming a variety of personas with ease.", age: 3, breed: Faker::Creature::Cat.breed, address: "4 Keppel Street, Coventry")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377071/Q.jpg")
cat.img_1.attach(io: file, filename: "Q.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Lucky", personality: "With fur as fluffy as a cloud and eyes that twinkle with mischief, this irrepressible little scamp is a true free spirit, marching to the beat of its own drum.", age: 10, breed: Faker::Creature::Cat.breed, address: "8th Arrondissement, Paris")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377069/R.jpg")
cat.img_1.attach(io: file, filename: "R.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Francis", personality: "This curious little creature is a true connoisseur of the absurd, delighting in the absurdities of everyday life with an infectious enthusiasm.", age: 7, breed: Faker::Creature::Cat.breed, address: "Geneva")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377062/S.jpg")
cat.img_1.attach(io: file, filename: "S.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Tuna", personality: "With fur as soft as a whisper and eyes that gleam with an inscrutable wisdom, this enigmatic feline is like a sage of the shadows.", age: 1, breed: Faker::Creature::Cat.breed, address: "Brussels")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377062/U.jpg")
cat.img_1.attach(io: file, filename: "U.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Jess", personality: "With a fur coat that shimmers like moonlight on a still lake and eyes that flicker with the wisdom of the ages, this cat is a creature of mystery and magic.", age: 5, breed: Faker::Creature::Cat.breed, address: "Zurich")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377061/V.jpg")
cat.img_1.attach(io: file, filename: "V.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Garlic", personality: "With fur that seems to emit a faint glow in the dark and eyes that shimmer like distant galaxies, this ethereal feline is like a creature from a surreal dream.", age: 1, breed: Faker::Creature::Cat.breed, address: "Luxembourg")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377058/W.jpg")
cat.img_1.attach(io: file, filename: "W.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user2, name: "Henry", personality: "Henry, the mighty lion of our household, has fur as majestic as a mane and eyes that burn with fiery intensity.", age: 3, breed: Faker::Creature::Cat.breed, address: "Norwich")
file = URI.open("https://res.cloudinary.com/dza4tj7f9/image/upload/v1716377058/X.jpg")
cat.img_1.attach(io: file, filename: "X.jpg", content_type: "image/jpg")
cat.save

puts 'Creating 5 star cats'

Rating.create!(rating: 5, cat_id: 12)
Rating.create!(rating: 5, cat_id: 12)
Rating.create!(rating: 5, cat_id: 12)
Rating.create!(rating: 5, cat_id: 12)
Rating.create!(rating: 5, cat_id: 12)
Rating.create!(rating: 5, cat_id: 12)
Rating.create!(rating: 5, cat_id: 21)
Rating.create!(rating: 5, cat_id: 21)
Rating.create!(rating: 5, cat_id: 21)
Rating.create!(rating: 5, cat_id: 21)
Rating.create!(rating: 5, cat_id: 21)
Rating.create!(rating: 5, cat_id: 21)
Rating.create!(rating: 5, cat_id: 21)
Rating.create!(rating: 5, cat_id: 21)
Rating.create!(rating: 5, cat_id: 21)
Rating.create!(rating: 5, cat_id: 21)

puts 'Creating ratings for other cats'

Rating.create!(rating: 4, cat_id: 1)
Rating.create!(rating: 4, cat_id: 1)
Rating.create!(rating: 4, cat_id: 2)
Rating.create!(rating: 4, cat_id: 2)
Rating.create!(rating: 3, cat_id: 2)
Rating.create!(rating: 3, cat_id: 3)
Rating.create!(rating: 4, cat_id: 4)
Rating.create!(rating: 3, cat_id: 4)
Rating.create!(rating: 3, cat_id: 5)
Rating.create!(rating: 5, cat_id: 5)
Rating.create!(rating: 4, cat_id: 6)
Rating.create!(rating: 4, cat_id: 6)
Rating.create!(rating: 3, cat_id: 6)
Rating.create!(rating: 4, cat_id: 7)
Rating.create!(rating: 3.5, cat_id: 8)
Rating.create!(rating: 4, cat_id: 8)
Rating.create!(rating: 4, cat_id: 9)
Rating.create!(rating: 5, cat_id: 9)
Rating.create!(rating: 4, cat_id: 9)
Rating.create!(rating: 4, cat_id: 9)
Rating.create!(rating: 3.5, cat_id: 10)
Rating.create!(rating: 4.5, cat_id: 11)
Rating.create!(rating: 4, cat_id: 11)
Rating.create!(rating: 4.5, cat_id: 13)
Rating.create!(rating: 4, cat_id: 13)
Rating.create!(rating: 4.5, cat_id: 14)
Rating.create!(rating: 4, cat_id: 14)
Rating.create!(rating: 3.5, cat_id: 15)
Rating.create!(rating: 4, cat_id: 16)
Rating.create!(rating: 3, cat_id: 17)
Rating.create!(rating: 4, cat_id: 18)
Rating.create!(rating: 3, cat_id: 19)
Rating.create!(rating: 4.5, cat_id: 20)
Rating.create!(rating: 4, cat_id: 22)
Rating.create!(rating: 3.5, cat_id: 23)

puts 'Creating Matches'

match = Match.new(cat: Cat.last, user: User.first, status: "accepted")
match.save

match = Match.new(cat: Cat.third, user: User.first, status: "declined")
match.save

match = Match.new(cat: Cat.first, user: User.first, status: "accepted")
match.save

match = Match.new(cat: Cat.second, user: User.first, status: "accepted")
match.save

match = Match.new(cat: Cat.fourth, user: User.first, status: "accepted")
match.save

match = Match.new(cat: Cat.fifth, user: User.first, status: "accepted")
match.save

puts 'Creating Chatrooms'

chatroom = Chatroom.new(name: "Henry", match: Match.first)
chatroom.save

chatroom = Chatroom.new(name: "Milo", match: Match.third)
chatroom.save

chatroom = Chatroom.new(name: "Luna", match: Match.fourth)
chatroom.save

chatroom = Chatroom.new(name: "Ponyo", match: Match.fifth)
chatroom.save

chatroom = Chatroom.new(name: "Sosuke", match: match)
chatroom.save

puts 'Finished seeding'
