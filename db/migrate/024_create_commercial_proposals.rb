class CreateCommercialProposals < ActiveRecord::Migration
  def self.up
    create_table :commercial_proposals do |t|
      t.column :name,             :string,  :null => false
      t.column :is_template,      :boolean, :default => false
      t.column :organization_id,  :integer, :null => false
      t.column :body,             :text
    end
  end

  def self.down
    drop_table :commercial_proposals
  end
end
