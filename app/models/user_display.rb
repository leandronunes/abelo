class UserDisplay < DisplayConfiguration

  def self.available_fields
    ['login', 'email','password', 'password_confirmation', 'template_description' ]
  end

  def self.describe(field)
    {
      'login' => t(:login),
      'email' => t(:email),
      'password' => t(:password),
      'password_confirmation' => t(:password_confirmation),
      'template_description' => t(:template)
    }[field] || field
  end

  def self.inlist_available_fields
    ['login', 'email', 'template_description' ] 
  end

  def self.break_lines
    ['template_description']
  end

  def self.titles
    self.available_fields
  end
 
end
