class CreateSells < ActiveRecord::Migration
  def self.up
    create_table :sells do |t|
      t.column :organization_id, :integer, :null => false
      t.column :customer_id,     :integer
      t.column :date,            :date,    :null => false
    end
  end

  def self.down
    drop_table :sells
  end
end
