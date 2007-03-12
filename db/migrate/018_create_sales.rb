class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.column :organization_id, :integer, :null => false
      t.column :customer_id,     :integer
      t.column :date,            :date,    :null => false
      t.column :cancelled,       :boolean, :null => false, :default => false
      t.column :user_id,         :integer, :null => false
    end
  end

  def self.down
    drop_table :sales
  end
end
