class AddColumnLedgerCategory < ActiveRecord::Migration
  def self.up
    add_column :ledger_categories, :periodicity_id, :integer
  end

  def self.down
    remove_column :ledger_categories, :periodicity_id
  end
end
