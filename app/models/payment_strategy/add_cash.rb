# This class is used on point of sale operations to realize add cash of till
class AddCash < PaymentBase

  def require_category?
    false
  end

  def is_add_cash?
    true
  end

  def create_printer_cmd!(ledger)
    return unless ledger.printer_command.nil?
    ledger.printer_command ||= PrinterCommand.new(ledger.owner ,[PrinterCommand::TILL_ADD_CASH, ledger.value]) 
    ledger.cmd_sent!
  end

  def set_as_done_on_save?
    true
  end

  def payment_initialize(cash)
    cash.payment_method = Payment::ADD_CASH
    cash.type_of = Payment::TYPE_OF_INCOME
    cash.date = Date.today
    cash.bank_account = cash.owner.default_bank_account unless cash.owner.nil?
    cash.pending!
  end

end
