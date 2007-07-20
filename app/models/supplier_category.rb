class SupplierCategory < Category

 has_many :suppliers, :foreign_key => 'category_id'

end
