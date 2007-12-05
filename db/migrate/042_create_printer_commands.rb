class CreatePrinterCommands < ActiveRecord::Migration
  def self.up
    create_table :printer_commands do |t|
      t.column :cmd,                     :string, :null => false
      t.column :cmd_params,              :string
      t.column :owner_id,                :integer
      t.column :owner_type,              :string
      t.column :status,                  :integer, :default => 0
      t.column :datetime,                :datetime, :null => false
      t.column :till_id,                 :integer, :null => false
      t.column :sequence_number,         :integer, :null => false
      t.column :cmd_id,                  :integer, :null => false
    end
  end

  def self.down
    drop_table :printer_commands
  end
end
