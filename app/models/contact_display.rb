class ContactDisplay < DisplayConfiguration

  #FIXME make this test
  def self.available_fields
    ['name', 'email', 'phone', 'description', 'fax'] #FIXME add this on 'category_id', 'cell_phone'
  end

  def self.describe(field)
    {
      'name' =>  t(:name),
      'email' =>  t(:email),
      'phone' =>  t(:phone),
      'description' =>  t(:description),
      'fax' =>  t(:fax),
    }[field] || field
  end

end
