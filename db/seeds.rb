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
van1 = Van.create!(title: "Van1", description: "Van1 description - magnifique pour partir en vacances et profiter en famille, en amis, en couple... pour 4 personnes maximum", price_per_day: 50, user_id: User.first.id, status: "disponible", location: "Paris")
van1.photos.attach(io: file, filename: "van1.jpg", content_type: "image/jpeg")
van1.save
file.close

file_path2 = Rails.root.join('app/assets/images/van2.jpg')
file2 = File.open(file_path2)
van2 = Van.create!(title:"Van2", description:"Van2 description - magnifique pour partir en vacances et profiter en famille, en amis, en couple... pour 4 personnes maximum", price_per_day: 60, user_id: User.first.id, status:"disponible", location:"Lille")
van2.photos.attach(io: file2, filename: "van2.jpg", content_type: "image/jpeg")
van2.save
file2.close

file_path3 = Rails.root.join('app/assets/images/van3.jpg')
file3 = File.open(file_path3)
van3 = Van.create!(title:"Van3", description:"Van3 description - magnifique pour partir en vacances et profiter en famille, en amis, en couple... pour 4 personnes maximum", price_per_day: 70, user_id: User.last.id, status:'réservé', location:"Bordeaux")
van3.photos.attach(io: file3, filename: "van3.jpg", content_type: "image/jpeg")
van3.save
file3.close

file_path4 = Rails.root.join('app/assets/images/van4.jpg')
file4 = File.open(file_path4)
van4 = Van.create!(title:"Van4", description:"Van4 description - magnifique pour partir en vacances et profiter en famille, en amis, en couple... pour 4 personnes maximum", price_per_day: 80, user_id: User.last.id, status:'réservé', location:"Lyon")
van4.photos.attach(io: file4, filename: "van4.jpg", content_type: "image/jpeg")
van4.save
file4.close
puts "Vans Terminée"

# Créer les reviews
puts "Creation reviews..."
review1 = Review.create!(comment: "Review1 comment", rating: 4, van_id: Van.first.id)
review2 = Review.create!(comment: "Review2 comment", rating: 3, van_id: Van.first.id)
review3 = Review.create!(comment: "Review3 comment", rating: 2, van_id: Van.last.id)
review4 = Review.create!(comment: "Review4 comment", rating: 1, van_id: Van.last.id)
puts "Reviews Terminée"

# Créer les bookings
puts "Creation bookings..."
booking1 = Booking.create!(start_date: "2021-12-01", end_date: "2021-12-10", status: "refusée", user_id: User.first.id, van_id: Van.first.id, price: van1.price_per_day * 10)
booking2 = Booking.create!(start_date: "2023-12-12", end_date: "2023-12-20", status: "annulée", user_id: User.first.id, van_id: Van.first.id, price: van2.price_per_day * 10)
booking3 = Booking.create!(start_date: "2024-05-01", end_date: "2024-05-10", status: "terminée", user_id: User.last.id, van_id: Van.last.id, price: van3.price_per_day * 10)
booking4 = Booking.create!(start_date: "2024-08-01", end_date: "2024-08-05", status: "attente", user_id: User.last.id, van_id: Van.last.id, price: van4.price_per_day * 10)
puts "Bookings Terminée"

# Créer les checkings
puts "Creation checkings..."
checking1 = Checking.create!(details: "Checking1 details", photo: "Checking1 photo", comment: "Checking1 comment", status: "attente", check_in_date: "2021-12-01", check_out_date: "2021-12-10", booking_id: Booking.first.id)
puts "Checkings Terminée"
