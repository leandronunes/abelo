# == Schema Information
# Schema version: 35
#
# Table name: departments
#
#  id              :integer       not null, primary key
#  name            :string(255)   not null
#  organization_id :integer       not null
#

class Department < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id
  validates_presence_of :organization_id
  validates_inclusion_of :organization_id, :within => Organization.find_all.collect{|o| o.id}, :if => lambda { |org| not org.organization_id.blank? }

  belongs_to :organization

  has_and_belongs_to_many :commercial_proposals

  acts_as_ferret
end
