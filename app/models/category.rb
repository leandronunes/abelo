class Category < ActiveRecord::Base

  validates_presence_of :name, :organization_id
  belongs_to :organization
  belongs_to :parent, :class_name => 'Category', :foreign_key => 'parent_id'

  acts_as_tree :order => 'name'

#  acts_as_ferret :remote => true

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

  def self.describe(name)
    {
      'product' => I18n.t(:product),
      'products' => I18n.t(:products),
      'supplier' => I18n.t(:supplier),
      'suppliers' => I18n.t(:suppliers),
      'worker' => I18n.t(:worker),
      'workers' => I18n.t(:workers),
      'customer' => I18n.t(:customer),
      'customers' => I18n.t(:customers),

    }[name] || name
  end

end
