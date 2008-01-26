class AddColumnLedgers < ActiveRecord::Migration
  def self.up
    add_column :ledgers, :payment_method, :string
  end

  def self.down
    remove_column :ledgers, :payment_method
  end
end
