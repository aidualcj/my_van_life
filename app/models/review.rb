class Review < ApplicationRecord
  belongs_to :van
  has_many :users, through: :vans
end
