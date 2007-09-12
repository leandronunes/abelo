class UserDisplay < DisplayConfiguration

  def self.available_fields
    ['login', 'email','password', 'password_confirmation', 'profiles' ]
  end

  def self.describe(field)
    {
      'login' => _('Login'),
      'email' => _('E-mail'),
      'profile_ids' => _('Profiles')
    }[field] || field
  end
 
end
