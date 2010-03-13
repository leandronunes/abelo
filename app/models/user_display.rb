class UserDisplay < DisplayConfiguration

  def self.available_fields
    ['login', 'email','password', 'password_confirmation', 'template_description' ]
  end

  def self.describe(field)
    {
      'login' => I18n.t(:login),
      'email' => I18n.t(:email),
      'password' => I18n.t(:password),
      'password_confirmation' => I18n.t(:password_confirmation),
      'template_description' => I18n.t(:template)
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
