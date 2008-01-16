class AddColumnSaleItems < ActiveRecord::Migration
  def self.up
    add_column :sale_items, :stock_id, :integer
  end

  def self.down
    remove_column :sale_items, :stock_id
  end
end
