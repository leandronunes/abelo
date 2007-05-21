class CreateCommercialProposalItems < ActiveRecord::Migration
  def self.up
    create_table :commercial_proposal_items do |t|
      t.column :name, :string
      t.column :item_order, :integer
      t.column :commercial_proposal_id, :integer
      t.column :size, :string, :limit => 1
    end
  end

  def self.down
    drop_table :commercial_proposal_items
  end
end
