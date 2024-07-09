class RemoveDateFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :date, :string
  end
end
