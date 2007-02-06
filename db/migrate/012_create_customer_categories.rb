class CreateCustomerCategories < ActiveRecord::Migration
  def self.up
    create_table :customer_categories do |t|
      t.column :name, :string, :null => false
      t.column :parent_id, :integer
      t.column :organization_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :customer_categories
  end
end
