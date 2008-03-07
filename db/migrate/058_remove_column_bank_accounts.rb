class RemoveColumnBankAccounts < ActiveRecord::Migration
  def self.up
    add_column :bank_accounts, :organization_id, :integer
    execute('update bank_accounts set organization_id = owner_id')
    remove_column :bank_accounts, :owner_id
    remove_column :bank_accounts, :owner_type
  end

  def self.down
    add_column :bank_accounts, :owner_id, :integer
    add_column :bank_accounts, :owner_type, :string
    execute("UPDATE bank_accounts SET owner_id = organization_id, owner_type = 'Organization'")
    remove_column :bank_accounts, :organization_id
  end
end
