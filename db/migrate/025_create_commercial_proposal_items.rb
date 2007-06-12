class CreateCommercialProposalItems < ActiveRecord::Migration
  def self.up
    create_table :commercial_proposal_items do |t|
      t.column :name,                            :string,  :null => false
      t.column :quantity,                        :integer, :null => false
      t.column :unit,                            :string
      t.column :number,                          :integer
      t.column :unitary_value,                   :float,   :null => false
      t.column :size,                            :string  
      t.column :type_of,                         :string,  :null => false
      t.column :commercial_proposal_section_id, :integer,  :null => false
    end
  end

  def self.down
    drop_table :commercial_proposal_items
  end
end
