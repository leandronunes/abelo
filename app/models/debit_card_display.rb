class DebitCardDisplay < LedgerDisplay

  DEBIT_CARD_AVAILABLE_FIELDS = %w[
    automatic_debit_owner_name
    automatic_debit_bank_id
    automatic_debit_account_agency
    automatic_debit_account_number
  ]

  def self.available_fields
    self.superclass.available_fields + DEBIT_CARD_AVAILABLE_FIELDS
  end

  def self.describe(field)
    {
      'automatic_debit_owner_name' => t(:name),
      'automatic_debit_bank_id' => t(:bank),
      'automatic_debit_account_agency' => t(:agency),
      'automatic_debit_account_number' => t(:account),
    }.merge(self.superclass::DESCRIBE_AVAILABLE_FIELDS)[field] || field
  end


end
