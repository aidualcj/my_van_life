class Message < ApplicationRecord
  belongs_to :van
  has_many :users, through: :vans, through: :bookings
end
