class AddCheckInDateToChecking < ActiveRecord::Migration[7.1]
  def change
    add_column :checkings, :check_in_date, :string
  end
end
