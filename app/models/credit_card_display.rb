class CreditCardDisplay < LedgerDisplay
  CREDIT_CARD_AVAILABLE_FIELDS = %w[
    credit_card_number
    credit_card_validity
    credit_card_secutiry_code
    credit_card_owner_name
    credit_card_cnpj
    credit_card_cpf
  ]

  def self.available_fields
    self.superclass.available_fields + CREDIT_CARD_AVAILABLE_FIELDS
  end

  def self.describe(field)
    {
      'credit_card_number' => _('Credit Card Number'),
      'credit_card_validity' => _('Validity'),
      'credit_card_secutiry_code' => _('Security Code'),
      'credit_card_owner_name' => _('Name'),
      'credit_card_cnpj' => _('CNPJ'),
      'credit_card_cpf' => _('CPF'),
    }.merge(self.superclass::DESCRIBE_AVAILABLE_FIELDS)[field] || field
  end


end
