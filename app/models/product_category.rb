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

class ProductCategory < Category

  has_many :products, :foreign_key => 'category_id'
  has_many :images, :through => :products
  validates_uniqueness_of :name, :scope => [:organization_id], :message => _('The name %{fn} for a product category was already taken.')

#TODO see what is the use of this
  def category_images(images = [])
    if self.leaf?
      images += self.images
    else
      self.children.each do |c|
        images += c.category_images(images)
      end
    end
    images
  end

end
