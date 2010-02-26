class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.column :name,             :string
      t.column :phone,            :string
      t.column :cell_phone,       :string
      t.column :fax,              :string
      t.column :email,            :string
      t.column :category_id,      :integer
      t.column :system_actor_id,  :integer
      t.column :owner_type,       :string
      t.column :owner_id,         :integer
      t.text :info, :description
    end
  end

  def self.down
    drop_table :contacts
  end
end
