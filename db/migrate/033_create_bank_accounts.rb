class CreateBankAccounts < ActiveRecord::Migration
  def self.up
    create_table :bank_accounts do |t|
      t.column :bank_id,           :integer
      t.column :agency,            :string
      t.column :variation,         :string
      t.column :account,           :string
      t.column :is_default,        :boolean, :default => false
      t.column :description,       :text
      t.references :organization
    end
  end

  def self.down
    drop_table :bank_accounts
  end
end
