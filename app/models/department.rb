class Department < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id
  validates_presence_of :organization_id
  validates_inclusion_of :organization_id, :within => Organization.find_all.collect{|o| o.id}, :if => lambda { |org| not org.organization_id.blank? }

  belongs_to :organization

  has_and_belongs_to_many :commercial_proposals

end
