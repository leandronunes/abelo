# == Schema Information
# Schema version: 35
#
# Table name: categories
#
#  id              :integer       not null, primary key
#  name            :string(255)   not null
#  type            :string(255)   not null
#  parent_id       :integer       
#  organization_id :integer       not null
#

class Category < ActiveRecord::Base

  validates_presence_of :name, :organization_id
  belongs_to :organization
  acts_as_tree :order => 'name'

  def full_name(sep = '/')
    self.parent ? (self.parent.full_name(sep) + sep + self.name) : (self.name)
  end
  def level
    self.parent ? (self.parent.level + 1) : 0
  end
  def top_level?
    self.parent.nil?
  end
  def leaf?
    self.children.empty?
  end
  
  def self.top_level_for(organization)
    self.find(:all, :conditions => ['parent_id is null and organization_id = ?', organization.id ])
  end

end
