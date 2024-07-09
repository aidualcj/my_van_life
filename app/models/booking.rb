class Booking < ApplicationRecord
  belongs_to :van
  belongs_to :user
  has_one :checking
  has_many :messages

  validates :user_id, presence: true
  validates :van_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
