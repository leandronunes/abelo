class CommercialProposalItem < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :commercial_proposal_id
  validates_presence_of :commercial_proposal_id
  validates_presence_of :item_order
  validates_presence_of :size
  validates_uniqueness_of :item_order, :scope => :commercial_proposal_id

  def save
    self[:size] = 'M' if size.nil?
    super
  end

end
