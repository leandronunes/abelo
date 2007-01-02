class ProductCategory < ActiveRecord::Base

  validates_presence_of :name, :organization_id
  belongs_to :organization
  acts_as_tree

  def full_name(sep = '/')
    self.parent ? (self.parent.full_name(sep) + sep + self.name) : (self.name)
  end
  def level
    self.parent ? (self.parent.level + 1) : 0
  end
  def top_level?
    self.parent.nil?
  end

end
