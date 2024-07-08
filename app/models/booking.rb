class Booking < ApplicationRecord
  belongs_to :van
  belongs_to :user
  has_one :checking
  has_one :message

end
