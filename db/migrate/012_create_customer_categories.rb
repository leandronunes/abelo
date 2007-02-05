class CreateCustomerCategories < ActiveRecord::Migration
  def self.up
    create_table :customer_categories do |t|
      # t.column :name, :string
    end
  end

  def self.down
    drop_table :customer_categories
  end
end
