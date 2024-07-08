class CreateCheckings < ActiveRecord::Migration[7.1]
  def change
    create_table :checkings do |t|
      t.text :details
      t.string :photo
      t.text :comment
      t.string :status

      t.timestamps
    end
  end
end
