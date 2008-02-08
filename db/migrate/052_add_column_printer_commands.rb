class AddColumnPrinterCommands < ActiveRecord::Migration
  def self.up
    add_column :printer_commands, :response, :text
    remove_column :printer_commands, :till_id
    add_column :printer_commands, :till_id, :integer
  end

  def self.down
    remove_column :printer_commands, :response
    remove_column :printer_commands, :till_id
    add_column :printer_commands, :till_id, :integer
  end
end
