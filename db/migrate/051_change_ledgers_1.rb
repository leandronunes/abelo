class ChangeLedgers1 < ActiveRecord::Migration
  def self.up
    add_column :ledgers, :payment_method, :string
    execute('UPDATE ledgers SET payment_method = type;')
    remove_column :ledgers, :type
  end

  def self.down
    add_column :ledgers, :type, :string
    execute('UPDATE ledgers SET type = payment_method;')
    remove_column :ledgers, :payment_method
  end
end
