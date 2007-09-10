class UserDisplay < DisplayConfiguration

  def self.available_fields
    ['login', 'email']
  end

  def self.describe(field)
    {
      'login' => _('Login'),
      'email' => _('E-mail'),
    }[field] || field
  end
 
end
