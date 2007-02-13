class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.column :name, :string, :null => false
      t.column :phone, :string
      t.column :email, :string
      t.column :customer_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :contacts
  end
end
