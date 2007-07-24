class Supplier < SystemActor

  has_and_belongs_to_many :products
  belongs_to :category, :class_name => 'SupplierCategory', :foreign_key => 'category_id' 

end
