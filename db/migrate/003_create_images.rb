class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :content_type, :filename, :thumbnail, :image_hash
      t.integer :size, :width, :height, :product_id, :parent_id
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
