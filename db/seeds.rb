require "cloudinary"
require "exifr/jpeg"

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

titres_gustave = ["L'Arrivée",
                  "Premiers Regards et Sourires",
                  "Découvrir le Monde",
                  "Petits Bruits et Gazouillis",
                  "Nuits Douces et Calmes",
                  "À Quatre Pattes",
                  "Exploration Sensorielle",
                  "Premiers Repas et Grimaces",
                  "Les Premiers Pas",
                  "Dix Mois de Bonheur"]

photos_gustave = ["Seed Gustave - 1 sur 10.jpeg",
                  "Seed Gustave - 2 sur 10.jpeg",
                  "Seed Gustave - 3 sur 10.jpeg",
                  "Seed Gustave - 4 sur 10.jpeg",
                  "Seed Gustave - 5 sur 10.jpeg",
                  "Seed Gustave - 6 sur 10.jpeg",
                  "Seed Gustave - 7 sur 10.jpeg",
                  "Seed Gustave - 8 sur 10.jpeg",
                  "Seed Gustave - 9 sur 10.jpeg",
                  "Seed Gustave - 10 sur 10.jpeg"]

titres_mathias = ["Bienvenue dans le Monde",
                  "Les Premiers Sourires",
                  "Découvrir le Toucher",
                  "Premiers Gazouillis",
                  "Les Nuits Magiques",
                  "À Quatre Pattes",
                  "Les Premiers Aliments Solides",
                  "Exploration et Curiosité",
                  "Premier Anniversaire – Joyeux 1 an !",
                  "Les Premiers Pas",
                  "Petits Défis, Grandes Victoires",
                  "Un An d'Amour et de Rires",
                  "Les Deux Ans Approchent",
                  "Premières Mots",
                  "Exploration du Monde",
                  "Les Premières Amitiés",
                  "Découvrir l'Imagination",
                  "Petits Gestes, Grandes Émotions",
                  "Deux Ans d'Émerveillement",
                  "Les Premiers Pourquoi ?",
                  "Petites Victoires Quotidiennes",
                  "Découvrir la Nature",
                  "Deuxième Anniversaire – Plein d'Amour et d'Aventures",
                  "Deux Ans de Bonheur Ininterrompu",
                  "Petits Héros et Héroïnes",
                  "L'Art de Partager",
                  "Petits Doutes, Grandes Certitudes",
                  "Les Trois Ans Approchent",
                  "Exploration de l'Art",
                  "Les Premières Histoires",
                  "Petits Explorateurs",
                  "Trois Ans d'Amour Inconditionnel",
                  "Les Petits Défis du Quotidien",
                  "Découvrir la Musique",
                  "Petites Étoiles Grandissantes",
                  "Troisième Anniversaire – Trois Ans de Joie et de Croissance"]

photos_mathias = ["Seed Mathias - 1 sur 33.jpeg",
                  "Seed Mathias - 2 sur 33.jpeg",
                  "Seed Mathias - 3 sur 33.jpeg",
                  "Seed Mathias - 4 sur 33.jpeg",
                  "Seed Mathias - 5 sur 33.jpeg",
                  "Seed Mathias - 6 sur 33.jpeg",
                  "Seed Mathias - 7 sur 33.jpeg",
                  "Seed Mathias - 8 sur 33.jpeg",
                  "Seed Mathias - 9 sur 33.jpeg",
                  "Seed Mathias - 11 sur 33.jpeg",
                  "Seed Mathias - 12 sur 33.jpeg",
                  "Seed Mathias - 13 sur 33.jpeg",
                  "Seed Mathias - 14 sur 33.jpeg",
                  "Seed Mathias - 15 sur 33.jpeg",
                  "Seed Mathias - 16 sur 33.jpeg",
                  "Seed Mathias - 17 sur 33.jpeg",
                  "Seed Mathias - 18 sur 33.jpeg",
                  "Seed Mathias - 19 sur 33.jpeg",
                  "Seed Mathias - 20 sur 33.jpeg",
                  "Seed Mathias - 21 sur 33.jpeg",
                  "Seed Mathias - 23 sur 33.jpeg",
                  "Seed Mathias - 24 sur 33.jpeg",
                  "Seed Mathias - 25 sur 33.jpeg",
                  "Seed Mathias - 26 sur 33.jpeg",
                  "Seed Mathias - 27 sur 33.jpeg",
                  "Seed Mathias - 28 sur 33.jpeg",
                  "Seed Mathias - 29 sur 33.jpeg",
                  "Seed Mathias - 30 sur 33.jpeg",
                  "Seed Mathias - 31 sur 33.jpeg",
                  "Seed Mathias - 32 sur 33.jpeg",
                  "Seed Mathias - 33 sur 33.jpeg"]

  index = 0

  photos_gustave.each do |photo|
    path = Rails.root.join("app/assets/images/seed/seed_gustave/#{photo}")
    file = File.open(path)
    date = EXIFR::JPEG.new(file).date_time
    date = Date.parse(date.to_s)
    memory = Memory.new(
      date: date,
      title: titres_gustave[index],
      location: locations.sample,
      user: User.all.sample
    )
    memory.save!
    ActionText::RichText.create!(record_type: 'Memory', record_id: memory.id, name: 'content', body: Faker::Lorem.sentence)
    puts "Created memory"
    index += 1
    memory.medias.attach(io: file, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
    puts "added photo"
  end

  index = 0

  photos_mathias.each do |photo|
    path = Rails.root.join("app/assets/images/seed/seed_mathias/#{photo}")
    file = File.open(path)
    date = EXIFR::JPEG.new(file).date_time
    date = Date.parse(date.to_s)
    memory = Memory.new(
      date: date,
      title: titres_mathias[index],
      location: locations.sample,
      user: User.all.sample
    )
    memory.save!
    ActionText::RichText.create!(record_type: 'Memory', record_id: memory.id, name: 'content', body: Faker::Lorem.sentence)
    puts "Created memory"
    index += 1
    memory.medias.attach(io: file, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
    puts "added photo"
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

# create specific memories

mathias_roll_over = Memory.new(
  date: "2021-03-20",
  title: "Mathias s'est retourné !",
  location: "Vincennes",
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
  location: "Vincennes",
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
  location: "Vincennes",
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

video1 = File.open(Rails.root.join("app/assets/images/seed/mathias_crawling.mp4"))
mathias_crawling.medias.attach(io: video1, filename: "video_#{rand(1..9999999)}.mp4", content_type: "video/mp4")
photo1 = File.open(Rails.root.join("app/assets/images/seed/mathias_crawling1.jpeg"))
mathias_crawling.medias.attach(io: photo1, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
photo14 = File.open(Rails.root.join("app/assets/images/seed/mathias_crawling2.jpeg"))
mathias_crawling.medias.attach(io: photo14, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
puts "added video"

mathias_walking = Memory.new(
  date: "2022-03-19",
  title: "Mathias sait marcher !",
  location: "Vincennes",
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
  location: "Vincennes",
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
  location: "Vincennes",
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

mathias_beach = Memory.new(
  date: "2022-08-01",
  title: "A la plage",
  location: "Plougasnou",
  user: romain
)
mathias_beach.save!
ActionText::RichText.create!(record_type: 'Memory', record_id: mathias_beach.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de Mathias. <strong>À l'âge de 11 mois</strong>, il a entrepris son tout premier voyage en quatre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
  <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>")
puts "Created specific memory 1"

Comment.create!(
  content: "La première fois que j'ai vu Mathias se déplacer à quatre pattes, mon cœur s'est rempli d'une joie indescriptible. C'est incroyable de voir à quel point il a grandi et gagné en indépendance. Ses petits pas hésitants ont donné le coup d'envoi à une nouvelle aventure, et je suis tellement fière de son exploration intrépide du monde qui l'entoure.",
  memory: mathias_beach,
  user: maud
)
puts "Created specific comment 1"

KeyMemory.create!(
  baby: Baby.find_by(first_name: "mathias"),
  memory: mathias_beach,
  event: "🏖️ Beach"
)
puts "Created specific key memory beach"

photo_mathias_beach = File.open(Rails.root.join("app/assets/images/seed/mathias_beach.jpeg"))
mathias_beach.medias.attach(io: photo_mathias_beach, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
puts "added photo"

mathias_scooter = Memory.new(
  date: "2022-10-22",
  title: "En trotinette",
  location: "Vincennes",
  user: romain
)
mathias_scooter.save!
ActionText::RichText.create!(record_type: 'Memory', record_id: mathias_scooter.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de Mathias. <strong>À l'âge de 11 mois</strong>, il a entrepris son tout premier voyage en quatre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
  <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>")
puts "Created specific memory 1"

Comment.create!(
  content: "La première fois que j'ai vu Mathias se déplacer à quatre pattes, mon cœur s'est rempli d'une joie indescriptible. C'est incroyable de voir à quel point il a grandi et gagné en indépendance. Ses petits pas hésitants ont donné le coup d'envoi à une nouvelle aventure, et je suis tellement fière de son exploration intrépide du monde qui l'entoure.",
  memory: mathias_scooter,
  user: maud
)
puts "Created specific comment 1"

KeyMemory.create!(
  baby: Baby.find_by(first_name: "mathias"),
  memory: mathias_scooter,
  event: "🛴 Scooter"
)
puts "Created specific key memory scooter"

photo_mathias_scooter = File.open(Rails.root.join("app/assets/images/seed/mathias_scooter.jpeg"))
mathias_scooter.medias.attach(io: photo_mathias_scooter, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
puts "added photo"

mathias_snow = Memory.new(
  date: "2022-12-27",
  title: "Le plein de neige",
  location: "Megève",
  user: romain
)
mathias_snow.save!
ActionText::RichText.create!(record_type: 'Memory', record_id: mathias_snow.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de Mathias. <strong>À l'âge de 11 mois</strong>, il a entrepris son tout premier voyage en quatre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
  <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>")
puts "Created specific memory 1"

Comment.create!(
  content: "La première fois que j'ai vu Mathias se déplacer à quatre pattes, mon cœur s'est rempli d'une joie indescriptible. C'est incroyable de voir à quel point il a grandi et gagné en indépendance. Ses petits pas hésitants ont donné le coup d'envoi à une nouvelle aventure, et je suis tellement fière de son exploration intrépide du monde qui l'entoure.",
  memory: mathias_snow,
  user: maud
)
puts "Created specific comment 1"

KeyMemory.create!(
  baby: Baby.find_by(first_name: "mathias"),
  memory: mathias_snow,
  event: "⛇ Snow"
)
puts "Created specific key memory snow"

photo_mathias_snow = File.open(Rails.root.join("app/assets/images/seed/mathias_snow.jpeg"))
mathias_snow.medias.attach(io: photo_mathias_snow, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
puts "added photo"

mathias_bed = Memory.new(
  date: "2023-03-26",
  title: "Un lit de grand",
  location: "Megève",
  user: romain
)
mathias_bed.save!
ActionText::RichText.create!(record_type: 'Memory', record_id: mathias_bed.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de Mathias. <strong>À l'âge de 11 mois</strong>, il a entrepris son tout premier voyage en quatre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
  <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>")
puts "Created specific memory 1"

Comment.create!(
  content: "La première fois que j'ai vu Mathias se déplacer à quatre pattes, mon cœur s'est rempli d'une joie indescriptible. C'est incroyable de voir à quel point il a grandi et gagné en indépendance. Ses petits pas hésitants ont donné le coup d'envoi à une nouvelle aventure, et je suis tellement fière de son exploration intrépide du monde qui l'entoure.",
  memory: mathias_bed,
  user: maud
)
puts "Created specific comment 1"

KeyMemory.create!(
  baby: Baby.find_by(first_name: "mathias"),
  memory: mathias_bed,
  event: "🛏️ Bed"
)
puts "Created specific key memory bed"

photo_mathias_bed = File.open(Rails.root.join("app/assets/images/seed/mathias_bed.jpeg"))
mathias_bed.medias.attach(io: photo_mathias_bed, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
puts "added photo"

mathias_school = Memory.new(
  date: "2023-09-05",
  title: "Première rentrée",
  location: "Megève",
  user: romain
)
mathias_school.save!
ActionText::RichText.create!(record_type: 'Memory', record_id: mathias_school.id, name: 'content', body: "<p>Aujourd'hui, un moment magique s'est produit dans la vie de Mathias. <strong>À l'âge de 11 mois</strong>, il a entrepris son tout premier voyage en quatre pattes. Les yeux brillants d'excitation, il a déployé toute son énergie pour explorer le monde qui l'entoure.</p>
  <p>Les premiers pas hésitants se sont transformés en mouvements plus assurés, et notre petit explorateur a commencé à parcourir la pièce avec une curiosité infinie. C'était un spectacle incroyable de voir sa petite silhouette se déplacer avec tant de détermination.</p>")
puts "Created specific memory 1"

Comment.create!(
  content: "La première fois que j'ai vu Mathias se déplacer à quatre pattes, mon cœur s'est rempli d'une joie indescriptible. C'est incroyable de voir à quel point il a grandi et gagné en indépendance. Ses petits pas hésitants ont donné le coup d'envoi à une nouvelle aventure, et je suis tellement fière de son exploration intrépide du monde qui l'entoure.",
  memory: mathias_school,
  user: maud
)
puts "Created specific comment 1"

KeyMemory.create!(
  baby: Baby.find_by(first_name: "mathias"),
  memory: mathias_school,
  event: "💼 School"
)
puts "Created specific key memory school"

photo_mathias_school = File.open(Rails.root.join("app/assets/images/seed/mathias_school.jpeg"))
mathias_school.medias.attach(io: photo_mathias_school, filename: "photo_#{rand(1..9999999)}.jpg", content_type: "image/jpg")
puts "added photo"
