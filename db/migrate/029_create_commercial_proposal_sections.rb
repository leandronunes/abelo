class CreateCommercialProposalSections < ActiveRecord::Migration
  def self.up
    create_table :commercial_proposal_sections do |t|
       t.column :name,                    :string,  :null => false
       t.column :commercial_proposal_id,  :integer, :null => false
    end
  end

  def self.down
    drop_table :commercial_proposal_sections
  end
end
