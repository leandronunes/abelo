class BankAccountDisplay < DisplayConfiguration

  def self.available_fields
    ['bank','agency','variation','account']
  end


  def self.describe(field)
    {
      'bank' =>  _('Bank'),
      'agency' => _('Agency'),
      'variation' => _('Variation'),
      'account' => _('Account'),
    }[field] || field
  end

end
