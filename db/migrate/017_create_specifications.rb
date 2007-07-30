class CreateSpecifications < ActiveRecord::Migration
  def self.up
    create_table :specifications do |t|
      t.column :name,            :string, :null => false
      t.column :organization_id, :int,    :null => false
    end
  end

  def self.down
    drop_table :specifications
  end
end
