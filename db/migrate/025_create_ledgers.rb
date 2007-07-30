class CreateLedgers < ActiveRecord::Migration
  def self.up
    create_table :ledgers do |t|
      t.column :owner_type,             :string, :null => false
      t.column :owner_id,               :integer, :null => false
      t.column :type,                   :string, :null => false
      t.column :category_id,            :integer, :null => false
      t.column :value,                  :float, :null => false
      t.column :description,            :string
      t.column :tag_list,               :string
      t.column :date,                   :date, :null => false
      t.column :interests,              :float, :default => 0
      t.column :interests_days,         :integer, :default => 0
      t.column :number_of_parcels,      :integer, :default => 1
      t.column :parcel_number,          :integer, :default => 1
      t.column :operational,            :boolean, :default => false, :null => false
      t.column :organization_id,        :integer,      :null => false

      #Identifies foreseen cash flows for generate foressen extract of 'cash flow
      t.column :is_foreseen,            :boolean,  :null => false, :default => false

    end
    
    add_index :ledgers, :category_id
  end

  def self.down
    remove_index  :ledgers, :category_id
    drop_table :ledgers
  end
end
