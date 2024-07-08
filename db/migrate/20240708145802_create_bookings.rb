class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :status
      t.decimal :price
      t.string :date
      t.references :message, null: false, foreign_key: true
      t.references :van, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :checking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
