class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :description, :string
      t.column :size, :string
      t.column :color, :string
      t.column :sell_price, :string
      t.column :unit, :string
      t.column :organization_id, :integer
    end
  end

  def self.down
    drop_table :products
  end
end
