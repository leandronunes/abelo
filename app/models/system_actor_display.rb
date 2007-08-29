class SystemActorDisplay < DisplayConfiguration

  def self.available_fields
    ['name', 'address', 'description', 'email', 'category_id', 'cnpj', 'cpf', 'rg', 'birthday']
  end


  def self.title_name
    _('Name')  
  end
  
  def self.title_address
    _('Address')  
  end
  
  def self.title_email
    _('Email')  
  end
  
  def self.title_category_id
    _('Category')  
  end
  
  def self.title_cnpj
    _('CNPJ')  
  end
  
  def self.title_cpf
    _('CPF')  
  end

  def self.title_rg
    _('RG')  
  end

  def self.title_birthday
    _('Birthday')
  end

  def self.title_description
    _('Description')
  end


end
