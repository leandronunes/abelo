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

  def is_change?
    false
  end

  def require_category?
    true
  end
  
  def set_as_done_on_save?
    false
  end

  def payment_initialize(ledger)
    ledger.status ||= Status::STATUS_PENDING
    ledger.date ||= Date.today
    ledger.bank_account ||= ledger.category.default_bank_account unless ledger.category.nil?
  end

  def create_printer_cmd!(ledger)
    return unless ledger.needs_fiscal_command?
    till = ledger.owner.kind_of?(Sale) ? ledger.owner.owner : ledger.owner
    ledger.printer_command = PrinterCommand.new(till, 
            [
              PrinterCommand::ADD_PAYMENT, ledger.fiscal_payment_type, 
              ledger.payment_type, ledger.value
            ])
    ledger.cmd_sent!
  end

  def display_class
    MoneyDisplay
  end

end
