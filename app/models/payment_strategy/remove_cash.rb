# This class is used on point of sale operations to realize remove cash of till
class RemoveCash < PaymentBase

  def is_remove_cash?
    true
  end

  def require_category?
    false
  end
  
  def set_as_done_on_save?
    true
  end

  def create_printer_cmd!(ledger)
    return '' unless ledger.has_fiscal_printer? and ledger.printer_command.nil?
    ledger.printer_command ||= PrinterCommand.new(ledger.owner ,[PrinterCommand::TILL_REMOVE_CASH, ledger.value])
    ledger.cmd_sent!
  end

  def payment_initialize(cash)
    cash.payment_method = Payment::REMOVE_CASH
    cash.type_of = Payment::TYPE_OF_EXPENSE
    cash.date = Date.today
    cash.bank_account = cash.organization.default_bank_account unless cash.organization.nil?
    cash.needs_fiscal_command = true
    cash.pending!
  end

end
