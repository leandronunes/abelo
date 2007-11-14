class BankAccountDisplay < DisplayConfiguration

  def self.available_fields
    ['bank','agency','variation','account', 'is_default']
  end


  def self.describe(field)
    {
      'bank' =>  _('Bank'),
      'agency' => _('Agency'),
      'variation' => _('Variation'),
      'account' => _('Account'),
      'is_default' => _('Is it default?'),
    }[field] || field
  end

end
