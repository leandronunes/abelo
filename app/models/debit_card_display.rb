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
      'automatic_debit_owner_name' => I18n.t(:name),
      'automatic_debit_bank_id' => I18n.t(:bank),
      'automatic_debit_account_agency' => I18n.t(:agency),
      'automatic_debit_account_number' => I18n.t(:account),
    }.merge(self.superclass::DESCRIBE_AVAILABLE_FIELDS)[field] || field
  end


end
