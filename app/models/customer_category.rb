class CustomerCategory < Category

  has_many :customers, :foreign_key => 'category_id'
  validates_uniqueness_of :name, :scope => [:organization_id], :message => I18n.t(:validates_uniqueness_of_name)

end
