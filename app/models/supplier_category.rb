class SupplierCategory < Category

 has_many :suppliers, :foreign_key => 'category_id'
 validates_uniqueness_of :name, :scope => [:organization_id], :message => I18n.t(:the_name_was_already_taken)


end
