class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.column :owner_type,      :string
      t.column :owner_id,        :interger
      t.column :organization_id, :interger
      t.column :full_product,    :text
      t.column :lite_product,    :text
      t.column :full_supplier,   :text
      t.column :lite_supplier,   :text
    end
  end

  def self.down
    drop_table :configurations
  end
end
