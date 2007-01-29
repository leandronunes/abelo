class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.column :user_id, :integer
      t.column :organization_id, :integer
      t.column :permissions, :text
    end
  end

  def self.down
    drop_table :user_profiles
  end
end
