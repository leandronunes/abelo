class AddColumnOrganizations < ActiveRecord::Migration
  def self.up
    add_column :organizations, :trade_name, :string, :null => false
    add_column :organizations, :state_registration, :string
    add_column :organizations, :responsible_person, :string
  end

  def self.down
    remove_column :organizations, :trade_name
    remove_column :organizations, :state_registration
    remove_column :organizations, :responsible_person
  end
end
