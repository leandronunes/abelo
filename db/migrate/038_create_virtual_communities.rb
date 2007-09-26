class CreateVirtualCommunities < ActiveRecord::Migration
  def self.up
    create_table :virtual_communities do |t|
      t.column :owner_type,  :string
      t.column :owner_id,    :integer
      t.column :name,        :string
      t.column :settings,    :text
      t.column :design_data, :text
      t.column :is_default, :boolean
    end
    VirtualCommunity.create!(:name => 'Default Environment', :is_default => true)
  end

  def self.down
    drop_table :virtual_communities
  end
end
