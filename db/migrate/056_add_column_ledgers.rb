class AddColumnLedgers < ActiveRecord::Migration
  def self.up
    add_column :ledgers, :organization_id, :integer
  end

  def self.down
    remove_column :ledgers, :organization_id
  end
end
