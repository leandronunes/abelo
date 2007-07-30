class CreateCommercialProposalsDepartments < ActiveRecord::Migration
  def self.up
    create_table :commercial_proposals_departments, :id => false do |t|
      t.column :commercial_proposal_id, :integer, :null => false
      t.column :department_id, :integer, :null => false
    end
  end

  def self.down
    drop_table :commercial_proposals_departments
  end
end
