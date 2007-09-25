class UserDisplay < DisplayConfiguration

  def self.available_fields
    ['login', 'email','password', 'password_confirmation', 'profiles' ]
  end

  def self.describe(field)
    {
      'login' => _('Login'),
      'email' => _('E-mail'),
      'password' => _('Password'),
      'password_confirmation' => _('Password Confirmation'),
      'profile_ids' => _('Profiles')
    }[field] || field
  end
 
end
