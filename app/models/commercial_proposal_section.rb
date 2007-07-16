# == Schema Information
# Schema version: 35
#
# Table name: commercial_proposal_sections
#
#  id                     :integer       not null, primary key
#  name                   :string(255)   not null
#  commercial_proposal_id :integer       not null
#

class CommercialProposalSection < ActiveRecord::Base
  has_many :commercial_proposal_items
  belongs_to :commercial_proposal
  validates_presence_of :name
  validates_presence_of :commercial_proposal_id
  validates_uniqueness_of :name, :scope => :commercial_proposal_id

  before_destroy{ |record| CommercialProposalItem.destroy_all "commercial_proposal_section_id = #{record.id}" }
end
