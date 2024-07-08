class CreateVans < ActiveRecord::Migration[7.1]
  def change
    create_table :vans do |t|
      t.string :title
      t.text :description
      t.decimal :price_per_day
      t.string :status
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
