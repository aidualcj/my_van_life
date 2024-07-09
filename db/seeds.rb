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
loic = User.create(name:"Loic", email:"carpentier.loic19@gmail.com", password: "123456", encrypted_password:"123456", phone_number:"06 12 34 56 78", address:"1 rue de la paix, 75001 Paris")
booking2.save!

jenna = User.create(name:"Jenna", email:"jennaandria@gmail.com", password: "123456", encrypted_password:"123456", phone_number:"06 12 34 56 78", address:"1 rue de la paix, 75001 Paris")
booking2.save!

tristan = User.create(name:"Tristan", email:"ibaneztristan@gmail.com", password: "123456", encrypted_password:"123456", phone_number:"06 12 34 56 78", address:"1 rue de la paix, 75001 Paris")
booking2.save!

solene = User.create(name:"Solene", email:"solene.baudic@gmail.com", password: "123456", encrypted_password:"123456", phone_number:"06 12 34 56 78", address:"1 rue de la paix, 75001 Paris")
booking2.save!

van1 = Van.create(title:"Van1", description:"Van1 description - magnifique pour partir en vacances et profiter en famille, en amis, en couple... pour 4 personnes maximum", price_per_day: 50, user_id: User.first.id, photos:"")
van1.save!

van2 = Van.create(title:"Van2", description:"Van2 description - magnifique pour partir en vacances et profiter en famille, en amis, en couple... pour 4 personnes maximum", price_per_day: 60, user_id: User.first.id, photos:"")
van2.save!

van3 = Van.create(title:"Van3", description:"Van3 description - magnifique pour partir en vacances et profiter en famille, en amis, en couple... pour 4 personnes maximum", price_per_day: 70, user_id: User.last.id, photos:"")
van3.save!

van4 = Van.create(title:"Van4", description:"Van4 description - magnifique pour partir en vacances et profiter en famille, en amis, en couple... pour 4 personnes maximum", price_per_day: 80, user_id: User.last.id, photos:"")
van4.save!

booking1 = Booking.create(start_date: "2021-12-01", end_date: "2021-12-10", status: "attente", user_id: User.first.id, van_id: Van.first.id, price: van1.price_per_day * 10)
booking1.save!

# checking1 = Checking.new(details: "Checking1 details", photo: "Checking1 photo", comment: "Checking1 comment", status: "pending")
# checking1.save!

# booking1.update!(checking: checking1)

booking2 = Booking.create(start_date: "2021-12-01", end_date: "2021-12-10", status: "attente", user_id: User.first.id, van_id: Van.first.id, price: van2.price_per_day * 10)
booking2.save!

booking3 = Booking.create(start_date: "2021-12-01", end_date: "2021-12-10", status: "attente", user_id: User.last.id, van_id: Van.last.id, price: van3.price_per_day * 10)
booking3.save!

booking4 = Booking.create(start_date: "2021-12-01", end_date: "2021-12-10", status: "attente", user_id: User.last.id, van_id: Van.last.id, price: van4.price_per_day * 10)
booking4.save!

review1 = Review.new(comment: "Review1 comment", rating: 4, van_id: Van.first.id)
review1.save!

review2 = Review.create(comment: "Review2 comment", rating: 3, van_id: Van.first.id)
review2.save!

review3 = Review.create(comment: "Review3 comment", rating: 2, van_id: Van.last.id)
review3.save!

review4 = Review.create(comment: "Review4 comment", rating: 1, van_id: Van.last.id)
review4.save!

# message1 = Message.create(content: "Message1 content", van_id: van1.id, booking_id: Booking.first.id)
# message1.save!

# message2 = Message.create(content: "Message2 content", van_id: van2.id, booking_id: Booking.first.id)
# message2.save!

# message3 = Message.create(content: "Message3 content", van_id: van3.id, booking_id: Booking.last.id)
# message3.save!

# message4 = Message.create(content: "Message4 content", van_id: van4.id, booking_id: Booking.last.id)
# message4.save!
