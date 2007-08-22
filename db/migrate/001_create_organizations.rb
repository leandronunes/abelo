class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.column :name,               :string, :null => false
      t.column :cnpj,               :string, :limit => 14
      t.column :nickname,           :string, :null => false
      t.column :design_data,        :text
      t.column :presentation,       :text
    end
  end

  def self.down
    drop_table :organizations
  end
end
