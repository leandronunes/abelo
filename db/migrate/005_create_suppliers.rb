class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.column :name, :string
      t.column :cnpj, :string
      t.column :organization_id, :integer
    end
  end

  def self.down
    drop_table :suppliers
  end
end
