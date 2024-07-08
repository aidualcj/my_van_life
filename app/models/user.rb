class User < ApplicationRecord
  has_many :vans
  has_many :bookings
  has_many :reviews, through: :vans
  has_many :messages, through: :vans, through: :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
