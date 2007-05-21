class CommercialProposal < ActiveRecord::Base

  validates_presence_of :department_id, :if => lambda { |proposal| proposal.organization_id.nil? }
  validates_presence_of :organization_id, :if => lambda { |proposal| proposal.department_id.nil? }
  validates_presence_of :template_name, :if => lambda { |proposal| proposal.is_template? }
  validates_uniqueness_of :template_name, :scope => :organization_id, :if => lambda { |proposal| proposal.is_template? }
  validates_uniqueness_of :template_name, :scope => :department_id, :if => lambda { |proposal| proposal.is_template? }

  has_many :commercial_proposal_items

end
