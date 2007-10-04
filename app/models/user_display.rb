class UserDisplay < DisplayConfiguration

  def self.available_fields
    ['login', 'email','password', 'password_confirmation', 'template_description' ]
  end

  def self.describe(field)
    {
      'login' => _('Login'),
      'email' => _('E-mail'),
      'password' => _('Password'),
      'password_confirmation' => _('Password Confirmation'),
      'template_description' => _('Template')
    }[field] || field
  end
 
end
