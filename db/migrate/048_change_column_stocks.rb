class ChangeColumnStocks < ActiveRecord::Migration
  def self.up
    change_column :stocks, :date, :datetime
  end

  def self.down
    change_column :stocks, :date, :date
  end
end
