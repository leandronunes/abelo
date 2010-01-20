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
      'credit_card_number' => t(:credit_card_number),
      'credit_card_validity' => t(:validity),
      'credit_card_secutiry_code' => t(:security_code),
      'credit_card_owner_name' => t(:name),
      'credit_card_cnpj' => t(:cnpj),
      'credit_card_cpf' => t(:cpf),
    }.merge(self.superclass::DESCRIBE_AVAILABLE_FIELDS)[field] || field
  end


end
