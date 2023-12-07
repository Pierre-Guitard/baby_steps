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
  birth_date: "1983-03-05",
  color: "#FFA69E"
)

avatarromain = File.open(Rails.root.join("app/assets/images/seed/romain.jpg"))
romain.avatar.attach(io: avatarromain, filename: "romain.jpg", content_type: "image/jpg")
romain.save!
puts "user romain created"

maud = User.new(
  email: "maud@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  first_name: "maud",
  last_name: "courthez",
  nickname: "chérie",
  birth_date: "1986-05-03",
  color: "#FAF3DD"
)
avatarmaud = File.open(Rails.root.join("app/assets/images/seed/maud.jpg"))
maud.avatar.attach(io: avatarmaud, filename: "maud.jpg", content_type: "image/jpg")
maud.save!
puts "user maud created"

# create babies
puts "creating babies"

mathias = Baby.new(
  first_name: "mathias",
  last_name: "nicault",
  nickname: "petit chat",
  birth_date: "2020-12-04",
  sex: "male",
  color: "#B8F2E6"
)
avatarmathias = File.open(Rails.root.join("app/assets/images/seed/mathias.jpg"))
mathias.avatar.attach(io: avatarmathias, filename: "mathias.jpg", content_type: "image/jpg")
mathias.save!
puts "baby mathias created"

gustave = Baby.new(
  first_name: "gustave",
  last_name: "nicault",
  nickname: "gugus",
  birth_date: "2023-02-12",
  sex: "male",
  color: "#AED9E0"
)
avatargustave = File.open(Rails.root.join("app/assets/images/seed/gustave.jpg"))
gustave.avatar.attach(io: avatargustave, filename: "gustave.jpg", content_type: "image/jpg")
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
  "Vincennes",
  "Nanterre",
  "Megève",
  "Courthézon",
  "Plougasnou"
]

puts "creating memories - add medias later"

titres = [
  "Le Jour J",
  "Les Premières Semaines",
  "Mois 1 à 3",
  "Le Premier Noël",
  "Développement et Milestones",
  "Exploration sensorielle",
  "Le Monde en Couleurs",
  "Les Moments de Complicité",
  "Les Premières Sorties",
  "La Routine du Coucher",
  "Famille et Amis",
  "Les Étapes de l'alimentation",
  "Exploration Créative",
  "Voyage dans le Temps",
  "Le Deuxième Anniversaire"
]

index = 0

15.times do
  memory = Memory.new(
    date: "#{rand(2021..2023)}-#{rand(1..12)}-#{rand(1..28)}",
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

seed_events = [
  ""
]

Memory.all.each do |memory|
  if memory.date.to_date > "2023-02-12".to_date
    key_memory1 = KeyMemory.new(
      baby: Baby.find_by(first_name: "gustave"),
      memory: memory,
      event: ""
    )
    key_memory1.save!
    puts "created key_memory"
    key_memory2 = KeyMemory.new(
      baby: Baby.find_by(first_name: "mathias"),
      memory: memory,
      event: ""
    )
    key_memory2.save!
    puts "created key_memory"
  else
    key_memory = KeyMemory.new(
      baby: Baby.find_by(first_name: "mathias"),
      memory: memory,
      event: ""
    )
    key_memory.save!
    puts "created key_memory"
  end
end

# add medias to memories

seed_medias = ["A7300234.jpeg",
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

index_photo = 0

Memory.all.each do |memory|
  rand(3..3).times do
    image = File.open(Rails.root.join("app/assets/images/seed/#{seed_medias[index_photo]}"))
    memory.medias.attach(io: image, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
    index_photo += 1
    puts "added photo"
  end
  puts "added medias to memory"
end


# create specific memories

mathias_roll_over = Memory.new(
  date: "2021-03-20",
  title: "Mathias s'est retourné !",
  location: "135 rue de Fontenay 94300 Vincennes",
  user: romain
)
mathias_roll_over.save!
ActionText::RichText.create!(record_type: 'Memory', record_id: mathias_roll_over.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de Mathias. <strong>À l'âge de 11 mois</strong>, il a entrepris son tout premier voyage en quatre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
  <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>")
puts "Created specific memory 1"

Comment.create!(
  content: "La première fois que j'ai vu Mathias se déplacer à quatre pattes, mon cœur s'est rempli d'une joie indescriptible. C'est incroyable de voir à quel point il a grandi et gagné en indépendance. Ses petits pas hésitants ont donné le coup d'envoi à une nouvelle aventure, et je suis tellement fière de son exploration intrépide du monde qui l'entoure.",
  memory: mathias_roll_over,
  user: maud
)
puts "Created specific comment 1"

KeyMemory.create!(
  baby: Baby.find_by(first_name: "mathias"),
  memory: mathias_roll_over,
  event: "🤸Roll over"
)
puts "Created specific key memory 1"

photo_mathias_roll_over = File.open(Rails.root.join("app/assets/images/seed/mathias_roll_over.jpeg"))
mathias_roll_over.medias.attach(io: photo_mathias_roll_over, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
puts "added photo"

mathias_sitting = Memory.new(
  date: "2021-06-05",
  title: "Mathias se tient assis !",
  location: "135 rue de Fontenay 94300 Vincennes",
  user: romain
)
mathias_sitting.save!
ActionText::RichText.create!(record_type: 'Memory', record_id: mathias_sitting.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de Mathias. <strong>À l'âge de 11 mois</strong>, il a entrepris son tout premier voyage en quatre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
  <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>")
puts "Created specific memory 1"

Comment.create!(
  content: "La première fois que j'ai vu Mathias se déplacer à quatre pattes, mon cœur s'est rempli d'une joie indescriptible. C'est incroyable de voir à quel point il a grandi et gagné en indépendance. Ses petits pas hésitants ont donné le coup d'envoi à une nouvelle aventure, et je suis tellement fière de son exploration intrépide du monde qui l'entoure.",
  memory: mathias_sitting,
  user: maud
)
puts "Created specific comment 1"

KeyMemory.create!(
  baby: Baby.find_by(first_name: "mathias"),
  memory: mathias_sitting,
  event: "🪑Sitting"
)
puts "Created specific key memory 1"

photo_mathias_sitting = File.open(Rails.root.join("app/assets/images/seed/mathias_sitting.jpeg"))
mathias_sitting.medias.attach(io: photo_mathias_sitting, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
puts "added photo"

mathias_crawling = Memory.new(
  date: "2021-10-21",
  title: "Mathias a fait du quatre pattes pour la première fois !",
  location: "135 rue de Fontenay 94300 Vincennes",
  user: romain
)
mathias_crawling.save!
ActionText::RichText.create!(record_type: 'Memory', record_id: mathias_crawling.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de Mathias. <strong>À l'âge de 11 mois</strong>, il a entrepris son tout premier voyage en quatre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
  <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>")
puts "Created specific memory 1"

Comment.create!(
  content: "La première fois que j'ai vu Mathias se déplacer à quatre pattes, mon cœur s'est rempli d'une joie indescriptible. C'est incroyable de voir à quel point il a grandi et gagné en indépendance. Ses petits pas hésitants ont donné le coup d'envoi à une nouvelle aventure, et je suis tellement fière de son exploration intrépide du monde qui l'entoure.",
  memory: mathias_crawling,
  user: maud
)
puts "Created specific comment 1"

KeyMemory.create!(
  baby: Baby.find_by(first_name: "mathias"),
  memory: mathias_crawling,
  event: "🐈 Crawling"
)
puts "Created specific key memory 1"

video1 = File.open(Rails.root.join("app/assets/images/seed/2021-10-20 - IMG_2472.mp4"))
mathias_crawling.medias.attach(io: video1, filename: "video_#{rand(1..9999999)}.mp4", content_type: "video/mp4")
photo1 = File.open(Rails.root.join("app/assets/images/seed/IMG_3143.jpeg"))
mathias_crawling.medias.attach(io: photo1, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
puts "added video"

mathias_walking = Memory.new(
  date: "2022-03-19",
  title: "Mathias sait marcher !",
  location: "135 rue de Fontenay 94300 Vincennes",
  user: romain
)
mathias_walking.save!
ActionText::RichText.create!(record_type: 'Memory', record_id: mathias_walking.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de Mathias. <strong>À l'âge de 11 mois</strong>, il a entrepris son tout premier voyage en quatre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
  <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>")
puts "Created specific memory 1"

Comment.create!(
  content: "La première fois que j'ai vu Mathias se déplacer à quatre pattes, mon cœur s'est rempli d'une joie indescriptible. C'est incroyable de voir à quel point il a grandi et gagné en indépendance. Ses petits pas hésitants ont donné le coup d'envoi à une nouvelle aventure, et je suis tellement fière de son exploration intrépide du monde qui l'entoure.",
  memory: mathias_walking,
  user: maud
)
puts "Created specific comment 1"

KeyMemory.create!(
  baby: Baby.find_by(first_name: "mathias"),
  memory: mathias_walking,
  event: "🚶Walking"
)
puts "Created specific key memory 1"

photo_mathias_walking = File.open(Rails.root.join("app/assets/images/seed/mathias_walking.jpeg"))
mathias_walking.medias.attach(io: photo_mathias_walking, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
puts "added photo"

gustave_roll_over = Memory.new(
  date: "2023-05-01",
  title: "Gustave s'est retourné !",
  location: "135 rue de Fontenay 94300 Vincennes",
  user: romain
)
gustave_roll_over.save!
ActionText::RichText.create!(record_type: 'Memory', record_id: gustave_roll_over.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de gustave. <strong>À l'âge de 11 mois</strong>, il a entrepris son tout premier voyage en quatre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
  <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>")
puts "Created specific memory 1"

Comment.create!(
  content: "La première fois que j'ai vu gustave se déplacer à quatre pattes, mon cœur s'est rempli d'une joie indescriptible. C'est incroyable de voir à quel point il a grandi et gagné en indépendance. Ses petits pas hésitants ont donné le coup d'envoi à une nouvelle aventure, et je suis tellement fière de son exploration intrépide du monde qui l'entoure.",
  memory: gustave_roll_over,
  user: maud
)
puts "Created specific comment 1"

KeyMemory.create!(
  baby: Baby.find_by(first_name: "gustave"),
  memory: gustave_roll_over,
  event: "🤸Roll over"
)
puts "Created specific key memory 1"

photo_gustave_roll_over = File.open(Rails.root.join("app/assets/images/seed/gustave_roll_over.jpeg"))
gustave_roll_over.medias.attach(io: photo_gustave_roll_over, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
puts "added photo"

gustave_sitting = Memory.new(
  date: "2023-09-24",
  title: "Gustave se tient assis !",
  location: "135 rue de Fontenay 94300 Vincennes",
  user: romain
)
gustave_sitting.save!
ActionText::RichText.create!(record_type: 'Memory', record_id: gustave_sitting.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de gustave. <strong>À l'âge de 11 mois</strong>, il a entrepris son tout premier voyage en quatre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
  <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>")
puts "Created specific memory 1"

Comment.create!(
  content: "La première fois que j'ai vu gustave se déplacer à quatre pattes, mon cœur s'est rempli d'une joie indescriptible. C'est incroyable de voir à quel point il a grandi et gagné en indépendance. Ses petits pas hésitants ont donné le coup d'envoi à une nouvelle aventure, et je suis tellement fière de son exploration intrépide du monde qui l'entoure.",
  memory: gustave_sitting,
  user: maud
)
puts "Created specific comment 1"

KeyMemory.create!(
  baby: Baby.find_by(first_name: "gustave"),
  memory: gustave_sitting,
  event: "🪑Sitting"
)
puts "Created specific key memory 1"

photo_gustave_sitting = File.open(Rails.root.join("app/assets/images/seed/gustave_sitting.jpeg"))
gustave_sitting.medias.attach(io: photo_gustave_sitting, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
puts "added photo"

# memory2 = Memory.new(
#   date: "2021-09-17",
#   title: "Prêt pour le vélo 🚲 !",
#   location: "135 rue de Fontenay 94300 Vincennes",
#   user: maud
# )
# memory2.save!
# ActionText::RichText.create!(record_type: 'Memory', record_id: memory2.id, name: 'content', body: "  <p>Une étape excitante dans la vie de Mathias : il a maintenant son propre casque de vélo, prêt pour de nouvelles aventures sur deux roues ! Aujourd'hui, nous avons fixé avec émotion son petit casque coloré et l'avons installé sur le siège enfant du vélo.</p>
#   <p>Ses yeux pétillaient d'excitation alors que nous nous apprêtions à commencer notre balade à vélo. Le cliquetis du casque et le bruit joyeux de sa voix résonnaient dans l'air, créant une ambiance de joie et d'aventure.</p>
#   <p>C'est incroyable de voir à quel point il grandit, de passer de spectateur à co-pilote sur nos escapades à vélo. Les premiers tours de roue avec son petit rire au vent sont des moments que nous chérirons à jamais. Une nouvelle page s'ouvre dans son livre d'aventures, et nous sommes impatients de partager de nombreuses balades ensemble.</p>
# ")
# puts "Created specific memory 2"

# Comment.create!(
#   content: "Le moment où Mathias a mis son casque de vélo pour la première fois restera gravé dans ma mémoire. Ses yeux pétillants de curiosité et d'excitation ont été la meilleure récompense pour cette nouvelle étape.
# L'ajustement du casque, les premiers tours de roue ensemble, chaque instant était chargé d'une énergie contagieuse. La sensation de partager ma passion pour le vélo avec lui était indescriptible, un moment père-fils que je chérirai toujours.
# À chaque son de son rire dans le siège enfant, je pouvais sentir l'aventure se déployer sous nos roues. C'est le début d'une série de balades à vélo mémorables, et je suis impatient de partager de nombreux kilomètres de bonheur sur deux roues avec mon petit coéquipier.",
#   memory: memory2,
#   user: romain
# )
# puts "Created specific comment 1"

# KeyMemory.create!(
#   baby: Baby.find_by(first_name: "mathias"),
#   memory: memory2,
#   event: ""
# )
# puts "Created specific key memory 2"

# photo2 = File.open(Rails.root.join("app/assets/images/seed/2021-09-17 - IMG_4285.jpeg"))
# memory2.medias.attach(io: photo2, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
# puts "added photo"

# memory3 = Memory.new(
#   date: "2023-11-20",
#   title: "Gustave a fait du quattre pattes pour la première fois !",
#   location: "135 rue de Fontenay 94300 Vincennes",
#   user: maud
# )
# memory3.save!
# ActionText::RichText.create!(record_type: 'Memory', record_id: memory3.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de Gustave. À l'âge de 11 mois, il a entrepris son tout premier voyage en quattre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
#   <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>
#   <p>À cet instant, le salon est devenu un terrain d'aventure infini pour Gustave. Chaque coin, chaque recoin, était une nouvelle découverte passionnante. Les sourires radieux et les petits gazouillis joyeux remplissaient l'air, créant une atmosphère de bonheur pur.</p>
#   <p>Les parents émerveillés ont immortalisé ce moment avec des medias et des vidéos, capturant les premiers pas indépendants de Gustave dans le monde de la mobilité. C'est un pas de plus vers son développement, et chaque instant de cette journée restera gravé dans nos mémoires comme une étape inoubliable de sa petite vie pleine d'aventures.</p>")
# puts "Created specific memory 3"

# KeyMemory.create!(
#   baby: Baby.find_by(first_name: "gustave"),
#   memory: memory3,
#   event: "crawling"
# )
# puts "Created specific key memory 3"

# photo3 = File.open(Rails.root.join("app/assets/images/seed/IMG_3088.jpeg"))
# memory3.medias.attach(io: photo3, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
# puts "added photo"
