# This class is used on point of sale operations to realize remove cash of till
class RemoveCash < PaymentBase

  def require_category?
    false
  end

  def is_remove_cash?
    true
  end
  
  def create_printer_cmd!(cash)
    cash.printer_command ||= PrinterCommand.new(cash.owner ,[PrinterCommand::TILL_REMOVE_CASH, cash.value]) if cash.has_fiscal_printer?
  end

  def set_as_done_on_save?
    true
  end

  def payment_initialize(cash)
    cash.payment_method = Payment::REMOVE_CASH
    cash.type_of = Payment::TYPE_OF_EXPENSE
    cash.date = Date.today
    cash.bank_account = cash.owner.default_bank_account unless cash.owner.nil?
    cash.pending!
  end

end
