class Van < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_many :messages
  has_one_attached :photos

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 100, message: "doit comporter au moins 100 caractères" }
  validates :price_per_day, presence: true, numericality: { greater_than: 0, message: "doit être un nombre positif" }
  validates :status, presence: true, inclusion: { in: %w(available unavailable), message: "doit être disponible ou indisponible" }
  validates :location, presence: true
end
