class Booking < ApplicationRecord
  belongs_to :message
  belongs_to :van
  belongs_to :user
  belongs_to :checking

end
