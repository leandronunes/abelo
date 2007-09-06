class SystemActorDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'address', 'description', 'email', 'category_id', 'cnpj', 'cpf', 'rg', 'birthday']
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'address' => _('Address'),
      'email' => _('Email'),
      'category_id' => _('Category'),
      'cnpj' => _('CNPJ'),
      'cpf' => _('CPF') ,
      'rg' => _('RG'),
      'birthday' => _('Birthday'),
      'description' => _('Description'),
    }[field] || field
  end

end
