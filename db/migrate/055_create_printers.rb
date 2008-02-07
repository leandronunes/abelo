class CreatePrinters < ActiveRecord::Migration
  def self.up
    create_table :printers do |t|
      t.column :serial,              :string, :null => false
      t.column :organization_id,     :interger, :null => false
      t.column :computer_id,          :string, :null => false
    end
  end

  def self.down
    drop_table :printers
  end
end
