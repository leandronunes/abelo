class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.column :description, :string
      t.column :picture, :string
      t.column :product_id, :integer
    end
  end

  def self.down
    drop_table :images
  end
end
