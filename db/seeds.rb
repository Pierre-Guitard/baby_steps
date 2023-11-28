# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# create users
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
  "135 rue de Fontenay 94300 Vincennes FRANCE",
  "122 rue Salvador Allende 92000 Nanterre FRANCE",
  "445 Chem. de la Riante Colline, 74120 Megève FRANCE",
  "2281 Rte de l'Europe, 84350 Courthézon FRANCE",
  "12 Rte du Sémaphore, 29630 Plougasnou FRANCE"
]

30.times do
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
## content
# create key_memories
## event
# add photos to memories
