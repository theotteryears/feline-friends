require "open-uri"

puts "Cleaning database..."

User.delete_all
Cat.delete_all
Match.delete_all

puts 'Creating users'

u1 = User.new(role: 0, email: "sitter@test.com", password: "123456", first_name: "Cat", last_name: "Sitter", details: "Hi, I am a cat sitter and I love cats")
file = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715178844/tran-mau-tri-tam-Fst4SmneRU4-unsplash_m04sde.jpg")
u1.img.attach(io: file, filename: "tran-mau-tri-tam-Fst4SmneRU4-unsplash_m04sde.jpg", content_type: "image/jpg")
u1.save
u2 = User.create!(role: 1, email: "owner@test.com", password: "123456", first_name: "Cat", last_name: "Owner", details: "Hi, I am a cat owner and I really need to find a cat sitter")
file = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715178845/laura-chouette-RhvEChrPHQE-unsplash_mtfnkv.jpg")
u2.img.attach(io: file, filename: "laura-chouette-RhvEChrPHQE-unsplash_mtfnkv.jpg", content_type: "image/jpg")
u2.save

puts 'Creating cats'

cat = Cat.new(user: u2, name: "George", details: "Cute")
file1 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715159584/george.jpg")
cat.img_1.attach(io: file1, filename: "george.jpg", content_type: "image/jpg")
file2 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715159405/20190513_165900_IMG_0552_vtkfsc.jpg")
cat.img_2.attach(io: file2, filename: "20190513_165900_IMG_0552_vtkfsc.jpg", content_type: "image/jpg")
file3 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715171938/20240227_183859_ehviep.jpg")
cat.img_3.attach(io: file3, filename: "20240227_183859_ehviep.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: u2, name: "Leia", details: "Shy but sweet")
file1 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715162028/leia.jpg")
cat.img_1.attach(io: file1, filename: "leia.jpg", content_type: "image/jpg")
file2 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715171589/IMG-20210619-WA0000_mc1lql.jpg")
cat.img_2.attach(io: file2, filename: "IMG-20210619-WA0000_mc1lql.jpg", content_type: "image/jpg")
file3 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715171945/IMG-20240115-WA0003_uds5er.jpg")
cat.img_3.attach(io: file3, filename: "IMG-20240115-WA0003_uds5er.jpg", content_type: "image/jpg")
cat.save

cat = Cat.new(user: u2, name: "Flower", details: "A beautiful fluffy cat")
file1 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715171946/IMG-20240419-WA0010_orqowo.jpg")
cat.img_1.attach(io: file1, filename: "IMG-20240419-WA0010_orqowo.jpg", content_type: "image/jpg")
file2 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715171946/IMG-20240419-WA0012_y0sgfj.jpg")
cat.img_2.attach(io: file2, filename: "IMG-20240419-WA0012_y0sgfj.jpg", content_type: "image/jpg")
file3 = URI.open("https://res.cloudinary.com/djdqlglck/image/upload/v1715171946/IMG-20240419-WA0016_ztpepn.jpg")
cat.img_3.attach(io: file3, filename: "IMG-20240419-WA0016_ztpepn.jpg", content_type: "image/jpg")
cat.save
# puts 'Creating matches'

# Match.create!(user_id: 1, cat_id: 1)
# Match.create!(user_id: 1, cat_id: 2)

puts 'Finished seeding'
