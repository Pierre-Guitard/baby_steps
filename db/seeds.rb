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

titres = [
  "Le Jour J : Bienvenue dans le monde, Mathias !",
  "Les Premières Semaines : Nuits blanches et premiers sourires.",
  "Mois 1 à 3 : Les premiers moments magiques et les découvertes du nouveau-né.",
  "Le Premier Noël : Un moment spécial en famille avec Mathias.",
  "Développement et Milestones : Les premiers pas, les premiers mots.",
  "Exploration sensorielle : Toucher, goûter, voir, entendre, sentir.",
  "Le Monde en Couleurs : Les premières réactions face aux couleurs et formes.",
  "Les Moments de Complicité : Premiers jeux et câlins avec papa et maman.",
  "Les Premières Sorties : Découvrir le monde extérieur avec Mathias.",
  "La Routine du Coucher : Histoires, berceuses et rituels apaisants.",
  "Famille et Amis : Les premières rencontres et liens affectifs.",
  "Les Étapes de l'alimentation : Des biberons aux premiers repas solides.",
  "Exploration Créative : Les premiers dessins, bricolages et créations.",
  "Voyage dans le Temps : Comparaisons entre le premier et le deuxième anniversaire.",
  "La Fête du Deuxième Anniversaire : Célébration et réflexions sur ces 24 premiers mois incroyables."
]

index = 0

15.times do
  memory = Memory.new(
    date: "#{rand(2020..2022)}-#{rand(1..12)}-#{rand(1..28)}",
    title: titres[index],
    location: locations.sample,
    user: User.all.sample
  )
  memory.save!
  ActionText::RichText.create!(record_type: 'Memory', record_id: memory.id, name: 'content', body: Faker::Lorem.sentence)
  puts "Created memory"
  index += 1
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

Memory.all.each do |memory|
  if memory.date.to_date > "2023-02-12".to_date
    key_memory1 = KeyMemory.new(
      baby: Baby.find_by(first_name: "gustave"),
      memory: memory,
      event: KeyMemory::EVENTS.sample
    )
    key_memory1.save!
    puts "created key_memory"
    key_memory2 = KeyMemory.new(
      baby: Baby.find_by(first_name: "mathias"),
      memory: memory,
      event: KeyMemory::EVENTS.sample
    )
    key_memory2.save!
    puts "created key_memory"
  else
    key_memory = KeyMemory.new(
      baby: Baby.find_by(first_name: "mathias"),
      memory: memory,
      event: KeyMemory::EVENTS.sample
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


# create specific memories

memory1 = Memory.new(
  date: "2021-10-20",
  title: "Mathias a fait du quattre pattes pour la première fois !",
  location: "135 rue de Fontenay 94300 Vincennes",
  user: romain
)
memory1.save!
ActionText::RichText.create!(record_type: 'Memory', record_id: memory1.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de Mathias. À l'âge de 11 mois, il a entrepris son tout premier voyage en quattre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
  <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>
  <p>À cet instant, le salon est devenu un terrain d'aventure infini pour Mathias. Chaque coin, chaque recoin, était une nouvelle découverte passionnante. Les sourires radieux et les petits gazouillis joyeux remplissaient l'air, créant une atmosphère de bonheur pur.</p>
  <p>Les parents émerveillés ont immortalisé ce moment avec des photos et des vidéos, capturant les premiers pas indépendants de Mathias dans le monde de la mobilité. C'est un pas de plus vers son développement, et chaque instant de cette journée restera gravé dans nos mémoires comme une étape inoubliable de sa petite vie pleine d'aventures.</p>")
puts "Created specific memory 1"

Comment.new(
  content: "La première fois que j'ai vu Mathias se déplacer à quatre pattes, mon cœur s'est rempli d'une joie indescriptible. C'est incroyable de voir à quel point il a grandi et gagné en indépendance. Ses petits pas hésitants ont donné le coup d'envoi à une nouvelle aventure, et je suis tellement fière de son exploration intrépide du monde qui l'entoure.
  Les rires et les sourires de Mathias ont illuminé la pièce, créant des souvenirs précieux que nous chérirons toujours. C'est une étape mémorable, et je suis impatiente de partager de nombreux moments similaires alors qu'il continue de grandir. Mon cœur de maman déborde de bonheur et de gratitude envers chaque petite étape de son voyage.
",
  memory: memory1,
  user: maud
)
puts "Created specific comment 1"

KeyMemory.new(
  baby: Baby.find_by(first_name: "mathias"),
  memory: memory1,
  event: "Crawling"
)
puts "Created specific key memory 1"

video1 = File.open(Rails.root.join("app/assets/images/seed/2021-10-20 - IMG_2472.mp4"))
memory1.photos.attach(io: video1, filename: "video_#{rand(1..9999999)}.jpg", content_type: "video/mp4")
puts "added video"
