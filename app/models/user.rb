class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :vans
  has_many :bookings
  has_many :reviews, through: :vans
  has_many :messages, through: :vans
  has_many :messages, through: :bookings

  validates :email, presence: true, uniqueness: true
end
