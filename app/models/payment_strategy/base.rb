class PaymentBase

  def is_money?
    false
  end

  def is_check?
    false
  end

  def is_debit_card?
    false
  end

  def is_credit_card?
    false
  end

  def is_add_cash?
    false
  end

  def is_remove_cash?
    false
  end

  def require_category?
    true
  end
  
  def set_as_done_on_save?
    false
  end

  def payment_initialize(ledger)
    ledger
  end

  def create_printer_cmd!(ledger)
    ledger.printer_command = PrinterCommand.new(ledger.owner, 
            [
              PrinterCommand::ADD_PAYMENT, ledger.fiscal_payment_type, 
              ledger.payment_type, ledger.value
            ]) if ledger.has_fiscal_printer?
  end

  def display_class
    MoneyDisplay
  end

end
