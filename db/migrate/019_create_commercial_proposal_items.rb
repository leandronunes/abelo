class CreateCommercialProposalItems < ActiveRecord::Migration
  def self.up
    create_table :commercial_proposal_items do |t|

      t.column :commercial_proposal_section_id,  :integer, :null => false

      #####################################################################
      ## Related information to an item that makes reference to a product 
      #####################################################################
      t.column :quantity,                        :integer, :null => false
      t.column :number,                          :integer
      t.column :unitary_value,                   :float,   :null => false
      t.column :product_id,                      :integer
      
      
      #####################################################################
      ## Related information to an item that makes reference to a product 
      #####################################################################
      t.column :service_id,                      :integer

    end
  end

  def self.down
    drop_table :commercial_proposal_items
  end
end
