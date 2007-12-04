class AddColumnSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :owner_type, :string
    add_column :sales, :owner_id, :integer
  end

  def self.down
    remove_column :sales, :owner_type
    remove_column :sales, :owner_id
  end
end
