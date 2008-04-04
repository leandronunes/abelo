class DebitCard < PaymentBase

  def is_debit_card?
    true
  end

  def display_class
    DebitCardDisplay
  end

  def fiscal_payment_type
    '03'
  end

end
