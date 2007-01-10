class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.column :name, :string, :null => false
      t.column :cnpj, :string, :limit => 14
      t.column :organization_id, :integer, :null => false

      t.column :address, :string
      t.column :birthday, :date
      t.column :cpf, :string, :limit => 11
      t.column :rg, :string
      t.column :description, :text
    end
  end

  def self.down
    drop_table :suppliers
  end
end
