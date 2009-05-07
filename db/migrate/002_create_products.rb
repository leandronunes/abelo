class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :name,            :string, :null => false
      t.integer :code
      t.column :size,            :string
      t.column :color,           :string
      t.column :description,     :text
      t.column :sell_price,      :float, :null => false
      t.references :unit_measure
      t.column :organization_id, :integer, :null => false
      t.column :category_id,     :integer, :null => false
      t.column :minimum_amount,  :integer
      t.column :info,            :text
    end
  end

  def self.down
    drop_table :products
  end
end
