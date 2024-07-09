class Checking < ApplicationRecord
  belongs_to :booking

  validates :booking_id, presence: true
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
end
