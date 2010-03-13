class ContactDisplay < DisplayConfiguration

  #FIXME make this test
  def self.available_fields
    ['name', 'email', 'phone', 'description', 'fax'] #FIXME add this on 'category_id', 'cell_phone'
  end

  def self.describe(field)
    {
      'name' =>  I18n.t(:name),
      'email' =>  I18n.t(:email),
      'phone' =>  I18n.t(:phone),
      'description' =>  I18n.t(:description),
      'fax' =>  I18n.t(:fax),
    }[field] || field
  end

end
