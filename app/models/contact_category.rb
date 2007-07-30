class ContactCategory < Category

 belongs_to :organization
 has_many :contacts, :foreign_key => 'category_id'

end
