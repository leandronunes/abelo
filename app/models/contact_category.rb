class ContactCategory < Category

 #FIXME We ave to refactoring this funtionality  

 belongs_to :organization
 has_many :contacts, :foreign_key => 'category_id'

end
