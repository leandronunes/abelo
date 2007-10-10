class CreateEnvironments < ActiveRecord::Migration
  def self.up
    create_table :environments do |t|
      t.column :owner_type,  :string
      t.column :owner_id,    :integer
      t.column :name,        :string
      t.column :settings,    :text
      t.column :design_data, :text
      t.column :is_default, :boolean
    end
    Design.design_root='designs/organization'
    Environment.create!(:name => 'Default Environment', :is_default => true)
  end

  def self.down
    drop_table :environments
  end
end
