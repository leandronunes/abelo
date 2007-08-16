class CreateOrganizationConfigurations < ActiveRecord::Migration
  def self.up
    create_table :organization_configurations do |t|
      t.column :full_product, :text
      t.column :lite_product, :text
      t.column :full_supplier, :text
      t.column :lite_supplier, :text
    end
  end

  def self.down
    drop_table :organization_configurations
  end
end
