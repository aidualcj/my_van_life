class RemoveCheckingFromBooking < ActiveRecord::Migration[7.1]
  def change
    remove_reference :bookings, :checking, foreign_key: true
  end
end
