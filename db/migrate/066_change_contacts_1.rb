class ChangeContacts1 < ActiveRecord::Migration
  def self.up
    drop_table :contacts
    #FIXME refactory this migrate

    create_table :contacts do |t|
      t.column :name,             :string
      t.column :phone,            :string
      t.column :cell_phone,       :string
      t.column :fax,              :string
      t.column :email,            :string
      t.column :description,      :text
      t.column :category_id,      :integer
      t.column :owner_type,       :string, :null => false
      t.column :owner_id,         :integer, :null => false

    end
  end

  def self.down
    drop_table :contacts

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
end
