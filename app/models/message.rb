class Message < ApplicationRecord
  belongs_to :van
  belongs_to :booking
  has_many :users, through: :vans
  has_many :users, through: :bookings

  validates :content, presence: true
  validates :van_id, presence: true
end
