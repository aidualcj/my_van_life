class Review < ApplicationRecord
  belongs_to :van
  has_many :users, through: :vans

  validates :rating, presence: { message: "Ne peut pas être vide" }, inclusion: { in: 1..5, message: "Doit être compris entre 1 et 5" }
  validates :comment, presence: { message: "Ne peut pas être vide" }, length: { maximum: 300, message: "Ne peut pas dépasser 300 caractères" }
  validates :van_id, presence: true

end
