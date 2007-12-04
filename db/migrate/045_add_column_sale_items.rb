class AddColumnSaleItems < ActiveRecord::Migration
  def self.up
    add_column :sale_items, :status, :integer, :default => 0
  end

  def self.down
    remove_column :sale_items, :status
  end
end
