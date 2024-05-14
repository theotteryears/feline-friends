require "open-uri"

puts "Cleaning database..."

User.destroy_all
Cat.destroy_all


puts 'Creating users'

u1 = User.new(role: 0, email: "sitter@test.com", password: "123456", first_name: "Catherine", last_name: "Cattington", city: "Coventry", details: "Hi, I am a cat sitter and I love cats. I'm super good at looking after cats. I have a lot of experience and I am very reliable. I am available to look after your cat for a week while you are on holiday. I can also do daily visits if you need.")
file = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715178844/tran-mau-tri-tam-Fst4SmneRU4-unsplash_m04sde.jpg")
u1.img.attach(io: file, filename: "tran-mau-tri-tam-Fst4SmneRU4-unsplash_m04sde.jpg", content_type: "image/jpg")
u1.save
u2 = User.create!(role: 1, email: "owner@test.com", password: "123456", first_name: "Holly", last_name: "Morris", city: "Coventry", details: "Hi, I am a cat owner and I really need to find a cat sitter. I have two cats, George and Leia. They are both very sweet and friendly. I need someone to look after them for a week while I am on holiday.")
file = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715178845/laura-chouette-RhvEChrPHQE-unsplash_mtfnkv.jpg")
u2.img.attach(io: file, filename: "laura-chouette-RhvEChrPHQE-unsplash_mtfnkv.jpg", content_type: "image/jpg")
u2.save

puts 'Creating cats'

cat = Cat.new(user: u2, name: "George", personality: "George loves to roam and discover new territories, always on the lookout for hidden treasures.", age: 10, breed: "Domestic Shorthair", address: "4 Keppel St, Coventry CV1 5HP, Royaume-Uni")
file1 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715159584/george.jpg")
cat.img_1.attach(io: file1, filename: "george.jpg", content_type: "image/jpg")
file2 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715159405/20190513_165900_IMG_0552_vtkfsc.jpg")
cat.img_2.attach(io: file2, filename: "20190513_165900_IMG_0552_vtkfsc.jpg", content_type: "image/jpg")
file3 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715171938/20240227_183859_ehviep.jpg")
cat.img_3.attach(io: file3, filename: "20240227_183859_ehviep.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: u2, name: "Siva", personality: "Siva is a sweet and affectionate cat, always ready to curl up in your lap for some quality snuggle time.", age: 1, breed: "British Shorthair", address: "Schauenbergstrasse 4, 8400 Winterthur")
file1 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715327181/img_6552__1_rmnqsl.jpg")
cat.img_1.attach(io: file1, filename: "img_6552__1_rmnqsl.jpg", content_type: "image/jpg")
file2 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715327177/IMG_6453_rjvwwu.jpg")
cat.img_2.attach(io: file2, filename: "IMG_6453_rjvwwu.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: u2, name: "Rubine", personality: "Rubine is full of energy and loves to play, whether it's chasing toys or pouncing on unsuspecting objects.", age: 3, breed: "Birman", address: "Schauenbergstrasse 4, 8400 Winterthur")
file1 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/a_-90/a_vflip/v1715344606/development/0b1mdh4c10b4xmghkzxnlo1wusmo.jpg")
cat.img_1.attach(io: file1, filename: "0b1mdh4c10b4xmghkzxnlo1wusmo.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: u2, name: "Leia", personality: "Leia is a shy cat, prefering to watch from a distance, quietly observing the world around them.", age: 5, breed: "British Shorthair", address: "Claridenstrasse 7, 8002 Zürich")
file1 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715162028/leia.jpg")
cat.img_1.attach(io: file1, filename: "leia.jpg", content_type: "image/jpg")
file2 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715171589/IMG-20210619-WA0000_mc1lql.jpg")
cat.img_2.attach(io: file2, filename: "IMG-20210619-WA0000_mc1lql.jpg", content_type: "image/jpg")
file3 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715171945/IMG-20240115-WA0003_uds5er.jpg")
cat.img_3.attach(io: file3, filename: "IMG-20240115-WA0003_uds5er.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: u2, name: "Flower", personality: "Flower is a bold and spirited, with a fiery personality, unafraid to speak their mind and assert their independence.", age: 13, breed: "Domestic Longhair", address: "Uraniastrasse 7, 8001 Zürich")
file1 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715171946/IMG-20240419-WA0010_orqowo.jpg")
cat.img_1.attach(io: file1, filename: "IMG-20240419-WA0010_orqowo.jpg", content_type: "image/jpg")
file2 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715171946/IMG-20240419-WA0012_y0sgfj.jpg")
cat.img_2.attach(io: file2, filename: "IMG-20240419-WA0012_y0sgfj.jpg", content_type: "image/jpg")
file3 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715171946/IMG-20240419-WA0016_ztpepn.jpg")
cat.img_3.attach(io: file3, filename: "IMG-20240419-WA0016_ztpepn.jpg", content_type: "image/jpg")
cat.save

puts 'Finished seeding'
