class Balance < PaymentBase

  def require_category?
    false
  end

  def is_balance?
    true
  end

  def display_class
    BalanceDisplay
  end

  def set_as_done_on_save?
    true
  end

  def payment_initialize(ledger)
    ledger.payment_method = Payment::BALANCE
    ledger.type_of = Payment::TYPE_OF_INCOME
    ledger.pending!
  end


end
