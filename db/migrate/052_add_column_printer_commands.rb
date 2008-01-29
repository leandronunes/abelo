class AddColumnPrinterCommands < ActiveRecord::Migration
  def self.up
    add_column :printer_commands, :error_message, :string
  end

  def self.down
    remove_column :printer_commands, :error_message
  end
end
