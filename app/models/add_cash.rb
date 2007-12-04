# This class is used on point of sale operations to realize add cash of till
class AddCash < Money

  has_one :printer_command, :as => :owner

  before_validation do |add_cash|
    add_cash.printer_command ||= PrinterCommand.new(add_cash.owner ,[PrinterCommand::TILL_ADD_CASH, add_cash.value])
  end

  def validate
    if self.date != Date.today
      self.errors.add(:date, _('You cannot schedule an add cash')) 
    end

    if self.value <= 0
      self.errors.add(:value, _('The value must be greater or equal to 0')) 
    end

    if self.type_of != Payment::TYPE_OF_INCOME
      self.errors.add(:type_of, _('You cannot have an add cash with type different of %s') % Payment::TYPE_OF_INCOME) 
    end

    if self.printer_command.nil?
      self.errors.add(_('You cannot add money on till without create the printer command')) 
    end
  end

  def initialize(till, *args)
    super(*args)
    self.payment_method = 'money'
    self.type_of = Payment::TYPE_OF_INCOME
    self.date = Date.today
    self.bank_account = till.organization.default_bank_account
    self.owner = till
    self.pending!
  end

  def printer_cmd_accept?
    self.pending? 
  end

  def accept_printer_cmd!(command)
    self.done!
    self.save!
  end

end
