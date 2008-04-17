class ContactDisplay < DisplayConfiguration

  #FIXME make this test
  def self.available_fields
    ['name', 'email', 'phone', 'description', 'fax'] #FIXME add this on 'category_id', 'cell_phone'
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'email' =>  _('Email'),
      'phone' =>  _('Phone'),
      'description' =>  _('Description'),
      'fax' =>  _('Fax'),
    }[field] || field
  end

end
