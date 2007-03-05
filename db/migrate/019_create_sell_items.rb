class CreateSellItems < ActiveRecord::Migration
  def self.up
    create_table :sell_items do |t|
      t.column :sell_id,      :integer,   :null => false
      t.column :product_id,   :integer,   :null => false
      t.column :ammount,      :float,     :null => false
    end
  end

  def self.down
    drop_table :sell_items
  end
end
