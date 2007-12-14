class RenameColumnSales < ActiveRecord::Migration
  def self.up
    remove_column :sales, :date
    add_column :sales, :datetime, :datetime
  end

  def self.down
    remove_column :sales, :datetime
    add_column :sales, :date, :date
  end
end
