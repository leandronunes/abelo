class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.column :name, :string, :null => false
      t.column :type, :string, :null => false  
      t.column :parent_id, :integer
      t.column :organization_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :categories
  end
end
