class AddEndDateToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :end_date, :string
  end
end
