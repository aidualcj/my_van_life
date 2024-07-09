class RemoveMessageIdFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :message_id, :integer
  end
end
