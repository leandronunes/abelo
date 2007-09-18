#FIXME see if it's correct because supplier is not an ActiveRecord object anymore
class ProductsSuppliers < ActiveRecord::Migration
  def self.up
    create_table :products_suppliers, :id => false do |t|
      t.column :product_id, :integer, :null => false
      t.column :supplier_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :products_suppliers
  end
end
