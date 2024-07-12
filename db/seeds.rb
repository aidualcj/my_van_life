# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# Supprimer les données existantes pour éviter les superpositions
require "open-uri"

Checking.destroy_all
Booking.destroy_all
Review.destroy_all
Van.destroy_all
User.destroy_all
puts "Data destroyed"

# Créer les utilisateurs
puts "Creation users..."
loic = User.create!(name:"Loic", email:"carpentier.loic19@gmail.com", password: "123456", phone_number:"06 12 34 56 78", address:"1 rue de la paix, 75001 Paris")
jenna = User.create!(name:"Jenna", email:"jennaandria@gmail.com", password: "123456", phone_number:"06 12 34 56 78", address:"1 rue de la paix, 75001 Paris")
tristan = User.create!(name:"Tristan", email:"ibaneztristan@gmail.com", password: "123456", phone_number:"06 12 34 56 78", address:"1 rue de la paix, 75001 Paris")
solene = User.create!(name:"Solene", email:"solene.baudic@gmail.com", password: "123456", phone_number:"06 12 34 56 78", address:"1 rue de la paix, 75001 Paris")
puts "Users Terminée"

# Créer les vans
puts "Creation vans..."


file_path = Rails.root.join('app/assets/images/van1.jpg')
file = File.open(file_path)
van1 = Van.create!(title: "Combi Volkswagen", description: "Magnifique van des années 80 pour partir en vacances et profiter en famille, en amis, en couple... pour 3 personnes maximum. Très bien équipé, prêt à vous accueillir !", price_per_day: 50, user_id: User.first.id, status: "disponible", location: "Paris",  longitude: 2.3522219, latitude: 48.8566140)
van1.photos.attach(io: file, filename: "van1.jpg", content_type: "image/jpeg")
van1.save
file.close

file_path2 = Rails.root.join('app/assets/images/van2.jpg')
file2 = File.open(file_path2)
van2 = Van.create!(title:"Camping car familial", description:"Profiter en famille de ce splendide camping car, pour passer de merveilleuses vacances avec vos enfants. Il convient pour une famille de 5 personnes.", price_per_day: 60, user_id: User.first.id, status:"disponible", location:"Lille", longitude: 3.0572560, latitude: 50.6292500)
van2.photos.attach(io: file2, filename: "van2.jpg", content_type: "image/jpeg")
van2.save
file2.close

file_path3 = Rails.root.join('app/assets/images/van3.jpg')
file3 = File.open(file_path3)
van3 = Van.create!(title:"Camping car Fiat", description:"Pour des vacances ensoleillées, louez mon camping car Fiat pour de belles aventures. Ce fidèle compagnon saura vous accompagner tout au long de votre voyage.", price_per_day: 70, user_id: User.last.id, status:'réservé', location:"Bordeaux", longitude: -0.5791800, latitude: 44.8404400)
van3.photos.attach(io: file3, filename: "van3.jpg", content_type: "image/jpeg")
van3.save
file3.close

file_path4 = Rails.root.join('app/assets/images/van4.jpg')
file4 = File.open(file_path4)
van4 = Van.create!(title:"Bus Tour (star 80)", description:"Idéal pour vos tournées musicales au fil des festivals de cet été. N'hésitez pas à louer notre superbe bus tour pour 12 personnes.", price_per_day: 80, user_id: User.last.id, status:'réservé', location:"Lyon", longitude: 4.8467100, latitude: 45.7484600)
van4.photos.attach(io: file4, filename: "van4.jpg", content_type: "image/jpeg")
van4.save
file4.close

file_path5 = Rails.root.join('app/assets/images/van5.jpg')
file5 = File.open(file_path5)
van5 = Van.create!(title:"Combi", description:"Idéal pour vos roadtrips dans toute la France. Il sera vous ravir par son ergonomie et son optimisation. Nombre maximum de personne : 4", price_per_day: 100, user_id: User.last.id, status:'réservé', location:"Marseille", longitude: 5.3697800, latitude: 43.2969500)
van5.photos.attach(io: file5, filename: "van5.jpg", content_type: "image/jpeg")
van5.save
file5.close

file_path5 = Rails.root.join('app/assets/images/van5.jpg')
file5 = File.open(file_path5)
van6 = Van.create!(title:"Combi", description:"Idéal pour vos roadtrips dans toute la France. Il sera vous ravir par son ergonomie et son optimisation. Nombre maximum de personne : 4", price_per_day: 100, user_id: User.last.id, status:'disponible', location:"Paris", longitude: 2.3522219, latitude: 48.8566140)
van6.photos.attach(io: file5, filename: "van5.jpg", content_type: "image/jpeg")
van6.save
file5.close

puts "Vans Terminée"

# Créer les reviews
puts "Creation reviews..."
review1 = Review.create!(comment: "Parfait ! On a passé un excellent séjour avec.", rating: 4, van_id: Van.first.id)
review2 = Review.create!(comment: "Rien à dire, le van est très bien équipé.", rating: 3, van_id: Van.first.id)
review3 = Review.create!(comment: "Super !", rating: 2, van_id: Van.last.id)
review4 = Review.create!(comment: "Incroyable, parfait pour nos raodtrip !", rating: 1, van_id: Van.last.id)
puts "Reviews Terminée"

# Créer les bookings
puts "Creation bookings..."
booking1 = Booking.create!(start_date: "2024-01-01", end_date: "2024-12-12", status: "acceptée", user_id: User.first.id, van_id: Van.first.id, price: van1.price_per_day * 10)
booking2 = Booking.create!(start_date: "2023-12-12", end_date: "2023-12-20", status: "annulée", user_id: User.first.id, van_id: Van.first.id, price: van2.price_per_day * 10)
booking3 = Booking.create!(start_date: "2024-05-01", end_date: "2024-05-10", status: "terminée", user_id: User.last.id, van_id: Van.last.id, price: van3.price_per_day * 10)
booking4 = Booking.create!(start_date: "2024-08-01", end_date: "2024-08-05", status: "acceptée", user_id: User.last.id, van_id: Van.last.id, price: van4.price_per_day * 10)

puts "Bookings Terminée"

# Créer les checkings
puts "Creation checkings..."
checking1 = Checking.create!(details: "Checking1 details", photo: "Checking1 photo", comment: "Checking1 comment", status: "attente", check_in_date: "2021-12-01", check_out_date: "2021-12-10", booking_id: Booking.first.id)
puts "Checkings Terminée"
