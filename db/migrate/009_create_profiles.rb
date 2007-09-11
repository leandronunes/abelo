class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.column :user_id,                      :integer
      t.column :virtual_community_id,         :integer
      t.column :name,                         :string
      t.column :organization_id,              :integer
      t.column :is_model,                     :boolean
      t.column :permissions,                  :text
    end
  end

  def self.down
    drop_table :profiles
  end
end
