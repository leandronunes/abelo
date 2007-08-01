class Department < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id
  validates_presence_of :organization_id
  validates_inclusion_of :organization_id, :within => Organization.find(:all).collect{|o| o.id}, :if => lambda { |org| not org.organization_id.blank? }

  belongs_to :organization

  has_and_belongs_to_many :commercial_proposals

  acts_as_ferret

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return [results.size, results]
  end
end
