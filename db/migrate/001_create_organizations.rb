class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.column :name, :string, :null => false
      t.column :cnpj, :string, :limit => 14
      t.column :nickname, :string, :null => false
      t.column :flexible_template_template,   :string, :default => "default"
      t.column :flexible_template_theme,      :string, :default => "default"
      t.column :flexible_template_icon_theme, :string, :default => "default"
    end
  end

  def self.down
    drop_table :organizations
  end
end
