class CommercialProposal < ActiveRecord::Base

  validates_presence_of :organization_id
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id

  def validate
    self.errors.add('is_template', _('You have to choose an option to the template')) if self.is_template.nil?
  end

  has_many :commercial_proposal_items

  has_and_belongs_to_many :departments

end
