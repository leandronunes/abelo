class BankAccountDisplay < DisplayConfiguration

  def self.available_fields
    ['bank','agency','variation','account','owner' ]
  end

  def self.title_bank
    _('Bank')
  end

  def self.title_agency
    _('Agency')
  end

  def self.title_variation
    _('Variation')
  end

  def self.title_account
    _('Account')
  end

  def self.title_owner
    _('Owner')
  end

end
