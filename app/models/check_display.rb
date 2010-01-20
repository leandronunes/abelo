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
      'check_owner_name' => t(:name),
      'check_bank_id' => t(:bank),
      'check_account_agency' => t(:agency),
      'check_account_number' => t(:account),
      'check_number' => t(:check_number),
      'check_cpf' => t(:cpf),
      'check_cnpj' => t(:cnpj),
    }.merge(self.superclass::DESCRIBE_AVAILABLE_FIELDS)[field] || field
  end

end
