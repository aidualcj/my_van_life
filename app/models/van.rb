class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_many :messages
  has_many_attached :photos
end
