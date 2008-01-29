class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.column :owner_type,           :string, :null => false
      t.column :owner_id,             :integer, :null => false
      t.column :city,                 :string, :null => false
      t.column :federation_unit,      :string, :null => false
      t.column :street,               :string
      t.column :number,               :string
      t.column :district,             :string
      t.column :zip_code,             :string
    end
  end

  def self.down
    drop_table :addresses
  end
end
