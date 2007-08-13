class SupplierCategory < Category

 has_many :suppliers, :foreign_key => 'category_id'
 validates_uniqueness_of :name, :scope => [:organization_id], :message => _('The name %{fn} for supplier category was already taken.')

end
