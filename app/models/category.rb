class Category < ActiveRecord::Base

  acts_as_ferret

  validates_presence_of :name, :organization_id
  belongs_to :organization
  acts_as_tree :order => 'name'

  def self.available_fields
    ['name', 'parent_id']
  end

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    results = self.find_by_contents(q, options)
    return results
  end

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

  def self.title_name
    _('Name')
  end

  def self.title_parent_id
    _('Related Category')
  end

end
