class Message < ApplicationRecord
  belongs_to :van
  belongs_to :booking
  has_many :users, through: :vans, through: :bookings
end
