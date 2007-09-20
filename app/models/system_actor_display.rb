class SystemActorDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'address', 'description', 'email', 'category', 'cnpj', 'cpf', 'rg', 'birthday', 'actor_type']
  end

  def self.describe(field)
    {
      'name' =>  _('Name'),
      'address' => _('Address'),
      'email' => _('Email'),
      'category' => _('Category'),
      'cnpj' => _('CNPJ'),
      'cpf' => _('CPF') ,
      'rg' => _('RG'),
      'birthday' => _('Birthday'),
      'description' => _('Description'),
      'actor_type' => _('Natural Person or Juristic Person'),
    }[field] || field
  end

end
