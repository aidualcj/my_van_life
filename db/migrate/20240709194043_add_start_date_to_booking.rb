class AddStartDateToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :start_date, :string
  end
end
