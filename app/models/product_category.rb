class ProductCategory < ActiveRecord::Base

  validates_presence_of :name, :organization_id
  belongs_to :organization
  has_many :products, :foreign_key => 'category_id'
  has_many :images, :through => :products
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
  
  def image
    self.images.size > 0 ? (self.images.find(rand(self.images.size) + 1)) : nil
  end

  def self.top_level_for(organization)
    self.find(:all, :conditions => ['parent_id is null and organization_id = ?', organization.id ])
  end

end
