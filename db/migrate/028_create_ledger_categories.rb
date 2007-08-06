class CreateLedgerCategories < ActiveRecord::Migration
  def self.up
    create_table :ledger_categories do |t|
      t.column :name,                   :string, :null => false
      t.column :interests,              :float, :default => 0
      t.column :interests_days,         :integer, :default => 0
      t.column :number_of_parcels,      :integer, :default => 1
      t.column :is_operational,         :boolean, :default => false, :null => false
      t.column :is_store,               :boolean, :default => false, :null => false
      t.column :organization_id,        :integer, :null => false
      t.column :type_of,                :string, :limit => 1, :null => false
    end
  end

  def self.down
    drop_table :ledger_categories
  end
end
