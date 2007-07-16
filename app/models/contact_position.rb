# == Schema Information
# Schema version: 35
#
# Table name: contact_positions
#
#  id              :integer       not null, primary key
#  name            :string(255)   not null
#  organization_id :integer       not null
#

class ContactPosition < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :organization_id
  
  belongs_to :organization
  has_many :contacts
end
