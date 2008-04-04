class Check < PaymentBase

  def is_check?
    true
  end

  def display_class
    CheckDisplay
  end

  def fiscal_payment_type
    '01'
  end

end
