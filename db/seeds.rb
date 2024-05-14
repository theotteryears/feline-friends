require "open-uri"
require "faker"

puts "Cleaning database..."

User.destroy_all
Cat.destroy_all
Match.destroy_all
Message.destroy_all
Chatroom.destroy_all

puts 'Creating Cat Sitter'

user1 = User.new(role: 0, email: "sitter@test.com", password: "123456", first_name: "Jessica", last_name: "Roche", city: "Brighton", details: "")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715718615/Sitter.jpg")
user1.img.attach(io: file, filename: "Sitter.jpg", content_type: "image/jpg")
user1.save

puts 'Creating Cat Owners'

user2 = User.new(role: 1, email: "owner@test.com", password: "123456", first_name: "Holly", last_name: "Clark", city: "London", details: "")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715718616/Owner1.jpg")
user2.img.attach(io: file, filename: "Owner1.jpg", content_type: "image/jpg")
user2.save

user3 = User.new(role: 1, email: Faker::Internet.email(domain: 'gmail.com'), password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: "Paris", details: "")
user3.save

user4 = User.new(role: 1, email: Faker::Internet.email(domain: 'gmail.com'), password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: "Zurich", details: "")
user4.save


puts 'Creating Cats'

cat = Cat.new(user: user2, name: "Milo", personality: "With fur as fluffy as a cloud and eyes that gleam like polished amber, Milo is our cuddly companion. Whether he's chasing toys or lounging in his favorite spot, Milo fills our home with warmth and love.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "London")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/1.jpg")
cat.img_1.attach(io: file, filename: "1.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user3, name: "Luna", personality: "A sassy little diva with a penchant for lounging in sunbeams and demanding attention on her terms. She's a master of the art of the purr, and she's not afraid to use it to get what she wants.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Paris")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/2.jpg")
cat.img_1.attach(io: file, filename: "2.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Sophie", personality: "Meet Sophie, the elegant queen of our household. Her fur, as sleek as satin, and eyes, as green as the forest, radiate grace and charm. Sophie's gentle purrs and regal presence bring peace and tranquility to our lives.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Altstetten, Zurich")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/3.jpg")
cat.img_1.attach(io: file, filename: "3.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Diego", personality: "Likes: Eating and sleeping - Dislikes: Being left alone for too long", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Hardbrücke, Zurich")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/4.jpg")
cat.img_1.attach(io: file, filename: "4.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "David", personality: "David, the mighty lion of our household, has fur as majestic as a mane and eyes that burn with fiery intensity. Whether he's prowling through the house or claiming his throne atop the highest perch, Leo's strength and courage inspire us all.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Enge, Zurich")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/5.jpg")
cat.img_1.attach(io: file, filename: "5.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Sir Pouncealot", personality: "He just will not stop jumping around. I hope you have some energy.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Wiedikon, Zurich")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/6.jpg")
cat.img_1.attach(io: file, filename: "6.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Lily", personality: "Lily, with fur as white as freshly fallen snow and eyes as bright as twinkling stars, is our little angel. Whether she's chasing butterflies or snuggled up in a warm blanket, Lily's innocence and purity bring joy to our hearts.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Wipkingen, Zurich")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/7.jpg")
cat.img_1.attach(io: file, filename: "7.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "George", personality: "With fur as curly as a plate of spaghetti and eyes as wobbly as jelly, is our eccentric explorer. Whether he's delving into the mysteries of the litter box or embarking on a quest to find the fabled land of Catnipia, George's quirky charm and unorthodox methods keep us guessing at every turn.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Coventry")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/8.jpg")
cat.img_1.attach(io: file, filename: "8.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Ponyo", personality: "With fur that defies gravity and eyes that seem to peer into other dimensions, this feline oddity is like a visitor from another planet. Whether it's practicing its synchronized swimming routine in the water bowl or staging elaborate pantomimes in the hallway, this cat's antics never fail to entertain.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Brighton")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/9.jpg")
cat.img_1.attach(io: file, filename: "9.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Sosuke", personality: "This enigmatic creature is a master of disguise, blending seamlessly into its surroundings like a chameleon in a rainbow factory. Whether it's masquerading as a potted plant or conducting covert surveillance from beneath the sofa, this cat's stealthy maneuvers and uncanny ability to vanish into thin air keep its human companions perpetually perplexed.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Hove")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/10.jpg")
cat.img_1.attach(io: file, filename: "10.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Jean-Claude", personality: "With a fur coat that rivals the fluffiness of a cumulus cloud and a penchant for avant-garde interpretive dance, this cat is a true eccentric. Whether it's composing symphonies with its tail on the piano or staging impromptu performance art pieces in the middle of the night, this feline free spirit marches to the beat of its own drum (or litter box).", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Paris")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/11.jpg")
cat.img_1.attach(io: file, filename: "11.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Dareos", personality: "This mysterious feline luminary is a creature of the shadows, emerging from the depths of the wardrobe like a nocturnal ninja. Whether it's practicing its ninja moves on unsuspecting houseplants or conducting top-secret meetings with its stuffed animal operatives, this cat's clandestine activities and covert operations would put even the most seasoned spy to shame.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Aussersihl, Zurich")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/12.jpg")
cat.img_1.attach(io: file, filename: "12.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Kenneth", personality: "This curious creature is a veritable whirlwind of energy and enthusiasm, bouncing off the walls like a pinball in a funhouse. Whether it's conducting experiments with gravity from the top of the bookshelf or staging impromptu acrobatics routines on the ceiling fan, this cat's boundless energy and relentless curiosity know no bounds.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Barcelona")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/13.jpg")
cat.img_1.attach(io: file, filename: "13.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Siva", personality: "With fur as soft as a cloud and eyes that twinkle with mischief, this whimsical feline is a creature of pure delight. Whether it's chasing imaginary butterflies through fields of dandelions or orchestrating elaborate tea parties for its collection of stuffed animals, this cat's playful antics and fanciful adventures are a joy to behold.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Schauenbergstrasse 4, 8400 Winterthur")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/14.jpg")
cat.img_1.attach(io: file, filename: "14.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Rubine", personality: "This regal feline aristocrat is a creature of refinement and sophistication, conducting itself with the grace and elegance of a prima ballerina. Whether it's sipping catnip-infused tea from fine porcelain cups or lounging on a velvet cushion like a monarch on its throne, this cat's aristocratic airs and refined tastes set it apart from its less discerning companions.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Schauenbergstrasse 6, 8400 Winterthur")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/15.jpg")
cat.img_1.attach(io: file, filename: "15.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Carlos", personality: "With fur as vibrant as a rainbow and eyes that shimmer like precious gemstones, this flamboyant feline is a true eccentric. Whether it's strutting its stuff on the catwalk (aka the hallway) or posing for selfies with its extensive collection of toy mice, this cat's larger-than-life personality and flair for the dramatic make it the star of the show wherever it goes.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Salisbury Road, Hove")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/16.jpg")
cat.img_1.attach(io: file, filename: "16.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Flower", personality: "This mischievous little rascal is a master of disguise, donning elaborate costumes and assuming a variety of personas with ease. Whether it's masquerading as a pirate on the high seas of the bathtub or channeling its inner ninja in the shadows of the laundry room, this cat's theatrical flair and penchant for drama are matched only by its boundless imagination.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "4 Keppel Street, Coventry")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/17.jpg")
cat.img_1.attach(io: file, filename: "17.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Lucky", personality: "With fur as fluffy as a cloud and eyes that twinkle with mischief, this irrepressible little scamp is a true free spirit, marching to the beat of its own drum (or litter box). Whether it's staging impromptu puppet shows with its tail or practicing its stand-up comedy routine on the kitchen counter, this cat's boundless creativity and irreverent sense of humor make it the life of the party wherever it goes.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "8th Arrondissement, Paris")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/18.jpg")
cat.img_1.attach(io: file, filename: "18.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Francis", personality: "This curious little creature is a true connoisseur of the absurd, delighting in the absurdities of everyday life with an infectious enthusiasm. Whether it's staging elaborate reenactments of famous historical events with its collection of toy mice or conducting philosophical debates with the family dog, this cat's whimsical antics and irrepressible joie de vivre bring a touch of surrealism to even the most mundane moments.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Geneva")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/19.jpg")
cat.img_1.attach(io: file, filename: "19.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Tuna", personality: "With fur as soft as a whisper and eyes that gleam with an inscrutable wisdom, this enigmatic feline is like a sage of the shadows. Whether it's communing with the spirits of its ancestors in the dead of night or contemplating the mysteries of the universe from the comfort of its favorite sunbeam, this cat's contemplative nature and mystical aura make it a creature of infinite depth and mystery.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Brussels")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/20.jpg")
cat.img_1.attach(io: file, filename: "20.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Jess", personality: "With a fur coat that shimmers like moonlight on a still lake and eyes that flicker with the wisdom of the ages, this cat is a creature of mystery and magic. Whether it's communing with the spirits of its ancestors in the dead of night or summoning thunderstorms with a flick of its tail, this feline sorcerer is a force to be reckoned with.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Zurich")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/21.jpg")
cat.img_1.attach(io: file, filename: "21.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Garlic", personality: "With fur that seems to emit a faint glow in the dark and eyes that shimmer like distant galaxies, this ethereal feline is like a creature from a surreal dream. Whether it's communing with the spirits of the houseplants or conducting séances with its fellow stuffed animal companions, this cat's mystical aura and otherworldly presence transcend the boundaries of ordinary reality.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Luxembourg")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/22.jpg")
cat.img_1.attach(io: file, filename: "22.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: user4, name: "Henry", personality: "This eccentric little ball of fur is a veritable tornado of chaos and confusion, leaving a trail of overturned furniture and misplaced socks in its wake. Whether it's practicing its interpretive dance routines in the middle of the living room or conducting elaborate experiments with gravity from the top of the staircase, this cat's boundless energy and insatiable curiosity know no bounds.", age: Faker::Number.within(range: 1..19), breed: Faker::Creature::Cat.breed, address: "Norwich")
file = URI.open("https://res.cloudinary.com/dyfh0tbvl/image/upload/v1715691432/23.jpg")
cat.img_1.attach(io: file, filename: "23.jpg", content_type: "image/jpg")
cat.save

puts 'Creating 5 star cats'

Rating.create!(rating: 5, cat_id: 12)
Rating.create!(rating: 5, cat_id: 21)

puts 'Finished seeding'
