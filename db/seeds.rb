require "cloudinary"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# create users

puts "cleaning everything before seed"
KeyMemory.delete_all
Comment.delete_all
Memory.delete_all
Parent.delete_all
Baby.delete_all
User.delete_all
# Cloudinary::Api.delete_all_resources

puts "creating users"
romain = User.new(
  email: "romain@baby-steps.app",
  password: "123456",
  password_confirmation: "123456",
  first_name: "romain",
  last_name: "nicault",
  nickname: "loulou",
  birth_date: "1983-03-05"
)
romain.save!
puts "user romain created"

maud = User.new(
  email: "maud@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  first_name: "maud",
  last_name: "courthez",
  nickname: "chérie",
  birth_date: "1986-05-03"
)
maud.save!
puts "user maud created"

# create babies
puts "creating babies"

mathias = Baby.new(
  first_name: "mathias",
  last_name: "nicault",
  nickname: "petit chat",
  birth_date: "2020-12-04",
  sex: "male"
)
mathias.save!
puts "baby mathias created"

gustave = Baby.new(
  first_name: "gustave",
  last_name: "nicault",
  nickname: "gugus",
  birth_date: "2023-02-12",
  sex: "male"
)
gustave.save!
puts "baby gustave created"

# create parents
puts "creating parents"
parent1 = Parent.new(
  baby: mathias,
  user: romain
)
parent1.save!
puts "parent entry 1 created"

parent2 = Parent.new(
  baby: mathias,
  user: maud
)
parent2.save!
puts "parent entry 2 created"

parent3 = Parent.new(
  baby: gustave,
  user: romain
)
parent3.save!
puts "parent entry 3 created"

parent4 = Parent.new(
  baby: gustave,
  user: maud
)
parent4.save!
puts "parent entry 4 created"

# create memories

locations = [
  "135 rue de Fontenay 94300 Vincennes",
  "122 rue Salvador Allende 92000 Nanterre",
  "445 Chem. de la Riante Colline, 74120 Megève",
  "2281 Rte de l'Europe, 84350 Courthézon",
  "12 Rte du Sémaphore, 29630 Plougasnou"
]

puts "creating memories - add photos later"
5.times do
  memory = Memory.new(
    date: "#{rand(2020..2023)}-#{rand(1..12)}-#{rand(1..28)}",
    title: Faker::Movie.title,
    content: Faker::Lorem.paragraph(sentence_count: rand(8..15)),
    location: locations.sample,
    user: User.all.sample
  )
  memory.save!
  puts "Created memory"
end

# create comments
puts "creating comments"

Memory.all.each do |memory|
  comment = Comment.new(
    content: Faker::Lorem.paragraph(sentence_count: rand(1..3)),
    memory: memory,
    user: memory.user.email == "romain@baby-steps.app" ? maud : romain
  )
  comment.save!
  puts "Created comment"
end

puts "creating key_memories"

events = [
  "Roll over",
  "Sitting",
  "Crawling",
  "Standing",
  "Walking",
  ""
]

Memory.all.each do |memory|
  if memory.date.to_date > "2023-02-12".to_date
    key_memory1 = KeyMemory.new(
      baby: Baby.find_by(first_name: "gustave"),
      memory: memory,
      event: events.sample
    )
    key_memory1.save!
    puts "created key_memory"
    key_memory2 = KeyMemory.new(
      baby: Baby.find_by(first_name: "mathias"),
      memory: memory,
      event: events.sample
    )
    key_memory2.save!
    puts "created key_memory"
  else
    key_memory = KeyMemory.new(
      baby: Baby.find_by(first_name: "mathias"),
      memory: memory,
      event: events.sample
    )
    key_memory.save!
    puts "created key_memory"
  end
end

# add photos to memories

seed_photos = ["A7300234.jpeg",
          "A7300371.jpeg",
          "A7300787.jpeg",
          "A7300825.jpeg",
          "A7302215.jpeg",
          "A7304409.jpeg",
          "A7307462.jpeg",
          "A7307568.jpeg",
          "A7307831.jpeg",
          "A7307998.jpeg",
          "A7308151.jpeg",
          "A7308356.jpeg",
          "A7309216.jpeg",
          "A7309220.jpeg",
          "A7309277.jpeg",
          "A7309795.jpeg",
          "A7309972.jpeg",
          "IMG_0167.jpeg",
          "IMG_1245.jpeg",
          "IMG_1252.jpeg",
          "IMG_1263.jpeg",
          "IMG_1432.jpeg",
          "IMG_1556.jpeg",
          "IMG_1603.jpeg",
          "IMG_1689.jpeg",
          "IMG_1970.jpeg",
          "IMG_1981.jpeg",
          "IMG_2059.jpeg",
          "IMG_2425.jpeg",
          "IMG_2490.jpeg",
          "IMG_2608.jpeg",
          "IMG_2673.jpeg",
          "IMG_2740.jpeg",
          "IMG_2785.jpeg",
          "IMG_2936.jpeg",
          "IMG_2989.jpeg",
          "IMG_3006.jpeg",
          "IMG_3143.jpeg",
          "IMG_3658.jpeg",
          "IMG_3925.jpeg",
          "IMG_4450.jpeg",
          "IMG_4586.jpeg"]

Memory.all.each do |memory|
  rand(2..3).times do
    image = File.open(Rails.root.join("app/assets/images/seed/#{seed_photos.sample}"))
    memory.photos.attach(io: image, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
    puts "added photo"
  end
  puts "added photos to memory"
end
