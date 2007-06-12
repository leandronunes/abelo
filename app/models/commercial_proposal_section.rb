class CommercialProposalSection < ActiveRecord::Base
  has_many :commercial_proposal_items
  belongs_to :commercial_proposal
end
