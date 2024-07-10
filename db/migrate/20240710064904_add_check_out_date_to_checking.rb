class AddCheckOutDateToChecking < ActiveRecord::Migration[7.1]
  def change
    add_column :checkings, :check_out_date, :string
  end
end
