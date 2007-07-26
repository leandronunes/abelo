class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.column :name,                         :string
      t.column :organization_id,              :integer
      t.column :permissions,                  :text
      t.column :user_id,                      :integer
    end
  end

  def self.down
    drop_table :profiles
  end
end
