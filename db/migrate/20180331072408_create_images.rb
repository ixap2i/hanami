class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :caption_id
      t.string :image_id
      t.string :title
      t.string :comment

      t.timestamps
    end
  end
end
