class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.column :organization_id, :integer,  :null => false
      t.column :customer_id,     :integer
      t.column :datetime,        :datetime, :null => false
      t.column :status,          :integer,  :null => false, :default => 0
      t.column :user_id,         :integer,  :null => false
      t.column :owner_type,      :string
      t.column :owner_id,        :integer
    end
  end

  def self.down
    drop_table :sales
  end
end
