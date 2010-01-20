class SystemActorDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'address', 'description', 'email', 'category', 'cnpj', 'cpf', 'rg', 'birthday', 'actor_type','info']
  end

  def self.all_available?
    false
  end

  def self.describe(field)
    {
      'name' =>  t(:name),
      'address' => t(:address),
      'email' => t(:email),
      'category' => t(:category),
      'cnpj' => t(:cnpj),
      'cpf' => t(:cpf) ,
      'rg' => t(:rg),
      'birthday' => t(:birthday),
      'description' => t(:description),
      'actor_type' => t(:natural_person_or_juristic_person),
      'info' => t(:additional_information),
    }[field] || field
  end

end
