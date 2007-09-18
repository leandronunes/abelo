class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.column :name,             :string, :null => false
      t.column :phone,            :string
      t.column :email,            :string
      t.column :description,      :text
      t.column :system_actor_id,  :integer, :null => false
      t.column :category_id,      :integer, :null => false
      t.column :info,             :text
    end
  end

  def self.down
    drop_table :contacts
  end
end
