class Checking < ApplicationRecord
  STATUS = %w(attente acceptée refusée annulée)
  belongs_to :booking

  validates :comment, presence: true
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :status, inclusion: { in: STATUS }
end
