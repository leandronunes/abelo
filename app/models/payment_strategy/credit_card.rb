class CreditCard < PaymentBase

  def is_credit_card?
    true
  end

  def display_class
    CreditCardDisplay
  end

  def fiscal_payment_type
    '02'
  end

end
