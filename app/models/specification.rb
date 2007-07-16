# == Schema Information
# Schema version: 35
#
# Table name: specifications
#
#  id              :integer       not null, primary key
#  name            :string(255)   not null
#  organization_id :integer       not null
#

class Specification < ActiveRecord::Base
  belongs_to :organization
end
