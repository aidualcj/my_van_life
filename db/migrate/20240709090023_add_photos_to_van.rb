class AddPhotosToVan < ActiveRecord::Migration[7.1]
  def change
    add_column :vans, :photos, :string
  end
end
