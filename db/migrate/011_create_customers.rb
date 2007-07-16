  class CreateCustomers < ActiveRecord::Migration
    def self.up
      create_table :customers do |t|
      t.column :name, :string, :null => false
      t.column :email, :string, :null => false
      t.column :birthday, :date
      t.column :address, :string
      t.column :cnpj, :string, :limit => 14
      t.column :cpf, :string, :limit =>11
      t.column :rg, :string
      t.column :description, :text
      t.column :organization_id, :integer, :null => false
      t.column :category_id, :integer
      end
   end

   def self.down
     drop_table :customers
   end
end
