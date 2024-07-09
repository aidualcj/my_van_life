class Review < ApplicationRecord
  belongs_to :van
  has_many :users, through: :vans

  validates :rating, presence: { message: "ne peut pas être vide" }, inclusion: { in: 1..5, message: "doit être compris entre 1 et 5" }
  validates :content, presence: { message: "ne peut pas être vide" }, length: { maximum: 300, message: "ne peut pas dépasser 300 caractères" }
  validates :user_id, presence: true
  validates :van_id, presence: true

end
