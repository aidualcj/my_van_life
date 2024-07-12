class Booking < ApplicationRecord
  STATUS = %w(attente acceptée terminée refusée annulée)
  belongs_to :van
  belongs_to :user
  has_one :checking, dependent: :destroy
  has_many :messages

  validates :user_id, presence: true
  validates :van_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :price, presence: true
  validates :status, inclusion: { in: STATUS }
end
