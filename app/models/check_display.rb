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
      'check_owner_name' => I18n.t(:name),
      'check_bank_id' => I18n.t(:bank),
      'check_account_agency' => I18n.t(:agency),
      'check_account_number' => I18n.t(:account),
      'check_number' => I18n.t(:check_number),
      'check_cpf' => I18n.t(:cpf),
      'check_cnpj' => I18n.t(:cnpj),
    }.merge(self.superclass::DESCRIBE_AVAILABLE_FIELDS)[field] || field
  end

end
