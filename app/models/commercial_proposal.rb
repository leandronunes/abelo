# == Schema Information
# Schema version: 35
#
# Table name: commercial_proposals
#
#  id              :integer       not null, primary key
#  name            :string(255)   not null
#  is_template     :boolean       
#  organization_id :integer       not null
#  body            :text          
#

class CommercialProposal < ActiveRecord::Base

  validates_presence_of :organization_id
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id

  acts_as_ferret

  has_many :commercial_proposal_sections
  has_and_belongs_to_many :departments
  belongs_to :organization

  def validate
    self.errors.add('is_template', _('You have to choose an option to the template')) if self.is_template.nil?
    self.errors.add( _('You have to choose almost an department to the commercial proposal')) if  (not self.organization.nil?) and (not self.organization.departments.empty?) and (self.departments.empty?)
  end

end
