class DebitCardDisplay < LedgerDisplay

  CHECK_AVAILABLE_FIELDS = %w[
    automatic_debit_owner_name
    automatic_debit_bank_id
    automatic_debit_account_agency
    automatic_debit_account_number
  ]

  def self.available_fields
    self.superclass.available_fields + CHECK_AVAILABLE_FIELDS
  end

  def self.describe(field)
    {
      'automatic_debit_owner_name' => _('Name'),
      'automatic_debit_bank_id' => _('Bank'),
      'automatic_debit_account_agency' => _('Agency'),
      'automatic_debit_account_number' => _('Account'),
    }.merge(self.superclass::DESCRIBE_AVAILABLE_FIELDS)[field] || field
  end


end
