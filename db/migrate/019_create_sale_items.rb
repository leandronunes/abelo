class CreateSaleItems < ActiveRecord::Migration
  def self.up
    create_table :sale_items do |t|
      t.column :sale_id,       :integer,   :null => false
      t.column :product_id,    :integer,   :null => false
      t.column :ammount,       :float,     :null => false
      t.column :unitary_price, :float,     :null => false
    end
  end

  def self.down
    drop_table :sale_items
  end
end
