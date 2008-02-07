# This class is used on point of sale operations to realize remove cash of till
class Change < PaymentBase

  def is_change?
    true
  end

  def require_category?
    false
  end
  
  def set_as_done_on_save?
    true
  end

  def create_printer_cmd!(ledger)
    return unless ledger.has_fiscal_printer? and ledger.printer_command.nil?
    till = ledger.owner.kind_of?(Sale) ? ledger.owner.owner : ledger.owner

#TODO change the fiscal register. now it's hard coded
    ledger.printer_command ||= PrinterCommand.new(till ,
                         [
                           PrinterCommand::ADD_PAYMENT, '00',
                           Payment::MONEY, '0.0'
                         ])
    ledger.cmd_sent!
  end

  def payment_initialize(cash)
    cash.payment_method = Payment::CHANGE
    cash.type_of = Payment::TYPE_OF_EXPENSE
    cash.date = Date.today
    cash.bank_account = cash.owner.default_bank_account unless cash.owner.nil?
    cash.pending!
  end

end
