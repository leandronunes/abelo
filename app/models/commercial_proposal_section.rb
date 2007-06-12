class CommercialProposalSection < ActiveRecord::Base
  has_many :commercial_proposal_items
end
