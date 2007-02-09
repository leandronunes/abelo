class CustomersCustomerCategories < ActiveRecord::Migration
  def self.up
    create_table :customers_customer_categories, :id => false do |t|
      t.column :customer_id, :integer, :null => false
      t.column :customer_category_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :customers_customer_categories
  end
end
