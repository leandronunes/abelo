class ChangeColumnLedgers < ActiveRecord::Migration
  def self.up
    change_column :ledgers, :foreseen_date, :datetime
    change_column :ledgers, :effective_date, :datetime
  end

  def self.down
    change_column :ledgers, :foreseen_date, :date
    change_column :ledgers, :effective_date, :date
  end
end
