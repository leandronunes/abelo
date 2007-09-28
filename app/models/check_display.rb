class CheckDisplay < LedgerDisplay

  CHECK_AVAILABLE_FIELDS = %w[
    check_owner_name
    check_bank_id
    check_account_agency
    check_account_number
    check_number
    check_cpf
    check_cnpj
  ]

  def self.available_fields
    self.superclass.available_fields + CHECK_AVAILABLE_FIELDS
  end

  def self.describe(field)
    {
      'check_owner_name' => _('Name'),
      'check_bank_id' => _('Bank'),
      'check_account_agency' => _('Agency'),
      'check_account_number' => _('Account'),
      'check_number' => _('Check Number'),
      'check_cpf' => _('CPF'),
      'check_cnpj' => _('CNPJ'),
    }.merge(self.superclass::DESCRIBE_AVAILABLE_FIELDS)[field] || field
  end

end
