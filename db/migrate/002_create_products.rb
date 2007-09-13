class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :name,            :string, :null => false
      t.column :code,            :string
      t.column :size,            :string
      t.column :color,           :string
      t.column :description,     :text
      t.column :sell_price,      :float, :null => false
      t.column :unit,            :string, :null => false
      t.column :organization_id, :integer, :null => false
      t.column :category_id,     :integer, :null => false
      t.column :minimum_amount,  :integer
    end
  end

  def self.down
    drop_table :products
  end
end
