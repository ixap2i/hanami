class AddPlaceToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :place, :string
  end
end
