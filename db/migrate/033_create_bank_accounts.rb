class CreateBankAccounts < ActiveRecord::Migration
  def self.up
    create_table :bank_accounts do |t|
      t.column :owner_type, :string
      t.column :owner_id,   :integer
      t.column :bank_id,    :integer
      t.column :agency,     :string
      t.column :variation,  :string
      t.column :account,    :string
    end
  end

  def self.down
    drop_table :bank_accounts
  end
end
