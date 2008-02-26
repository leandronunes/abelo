class CreateBalances < ActiveRecord::Migration
  def self.up
    create_table :balances do |t|
      t.column :value,            :float, :default => 0
      t.column :date,             :datetime
      t.column :bank_account_id,  :integer
    end
  end

  def self.down
    drop_table :balances
  end
end
