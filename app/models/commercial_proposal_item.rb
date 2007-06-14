class CommercialProposalItem < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :quantity
  validates_presence_of :unitary_value
  validates_presence_of :type_of
  validates_presence_of :commercial_proposal_section_id

  def total_value
    quantity * unitary_value
  end

end
