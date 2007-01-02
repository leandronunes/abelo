class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.column :description, :string, :null => false
      t.column :picture, :string, :null => false
      t.column :product_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :images
  end
end
