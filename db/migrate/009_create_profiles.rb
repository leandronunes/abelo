class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.column :name,                         :string
      t.column :organization_id,              :integer
      t.column :permissions,                  :text
      t.column :user_id,                      :integer
      t.column :flexible_template_template,   :string, :default => "default"
      t.column :flexible_template_theme,      :string, :default => "default"
      t.column :flexible_template_icon_theme, :string, :default => "default"
    end
  end

  def self.down
    drop_table :profiles
  end
end
