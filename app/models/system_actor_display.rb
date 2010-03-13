class SystemActorDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'address', 'description', 'email', 'category', 'cnpj', 'cpf', 'rg', 'birthday', 'actor_type','info']
  end

  def self.all_available?
    false
  end

  def self.describe(field)
    {
      'name' =>  I18n.t(:name),
      'address' => I18n.t(:address),
      'email' => I18n.t(:email),
      'category' => I18n.t(:category),
      'cnpj' => I18n.t(:cnpj),
      'cpf' => I18n.t(:cpf) ,
      'rg' => I18n.t(:rg),
      'birthday' => I18n.t(:birthday),
      'description' => I18n.t(:description),
      'actor_type' => I18n.t(:natural_person_or_juristic_person),
      'info' => I18n.t(:additional_information),
    }[field] || field
  end

end
