class Booking < ApplicationRecord
  belongs_to :van
  belongs_to :user
  has_one :checking
<<<<<<< HEAD
  has_many :message
=======
  has_many :messages
>>>>>>> ade0a2730b705f9f1799f04693605a9be43b1263

end
