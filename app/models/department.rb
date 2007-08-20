class Department < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :organization_id
  validates_presence_of :organization_id

  belongs_to :organization

  has_and_belongs_to_many :documents

  acts_as_ferret

  def self.available_fields
    ['name']
  end

  def self.title_name
    _('Name')
  end

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return results
  end


end
