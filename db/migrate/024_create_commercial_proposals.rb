class CreateCommercialProposals < ActiveRecord::Migration
  def self.up
    create_table :commercial_proposals do |t|
      t.column :template_name, :string
      t.column :is_template, :boolean
      t.column :department_id, :integer
      t.column :organization_id, :integer
    end
  end

  def self.down
    drop_table :commercial_proposals
  end
end
