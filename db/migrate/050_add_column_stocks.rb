class AddColumnStocks < ActiveRecord::Migration
  def self.up
    add_column :stocks, :invoice_id, :integer
  end

  def self.down
    remove_column :stocks, :invoice_id
  end
end
