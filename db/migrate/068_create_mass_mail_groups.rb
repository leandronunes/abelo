class CreateMassMailGroups < ActiveRecord::Migration
  def self.up
    create_table :mass_mail_groups do |t|
      t.column :name,                   :string, :null => false
      t.column :type,                   :string, :null => false
      t.column :organization_id,        :integer, :null => false
    end
  end

  def self.down
    drop_table :mass_mail_groups
  end
end
