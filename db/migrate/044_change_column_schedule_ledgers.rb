class ChangeColumnScheduleLedgers < ActiveRecord::Migration
  def self.up
    change_column :schedule_ledgers, :start_date, :datetime
  end

  def self.down
    change_column :schedule_ledgers, :start_date, :date
  end
end
