class ProductsSuppliers < ActiveRecord::Migration
  def self.up
    create_table :products_suppliers, :id => false do |t|
      t.column :product_id, :integer
      t.column :supplier_id, :integer
    end
  end

  def self.down
    drop_table :products_suppliers
  end
end
