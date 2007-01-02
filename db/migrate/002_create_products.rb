class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :description, :string, :null => false
      t.column :size, :string
      t.column :color, :string
      t.column :sell_price, :string, :null => false
      t.column :unit, :string, :null => false
      t.column :organization_id, :integer, :null => false
      t.column :category_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :products
  end
end
