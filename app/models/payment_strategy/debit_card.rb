class DebitCard < PaymentBase

  def is_debit_card?
    true
  end

  def display_class
    DebitCardDisplay
  end

end
