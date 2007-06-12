class CommercialProposal < ActiveRecord::Base

  validates_presence_of :organization_id
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id

  def validate
    self.errors.add('is_template', _('You have to choose an option to the template')) if self.is_template.nil?
    self.errors.add( _('You have to choose almost an department to the commercial proposal')) if  (not self.organization.nil?) and (self.organization.has_departments?) and (not self.has_departments?)
  end

  has_many :commercial_proposal_sections

  has_and_belongs_to_many :departments

  belongs_to :organization

end
