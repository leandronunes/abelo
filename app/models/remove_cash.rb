# This class is used on point of sale operations to realize remove cash of till
class RemoveCash < Money

  has_one :printer_command, :as => :owner

  before_validation do |cash|
    cash.value = cash.value * -1 if cash.value > 0
    cash.printer_command ||= PrinterCommand.new(cash.owner ,[PrinterCommand::TILL_REMOVE_CASH, cash.value]) if cash.owner.has_fiscal_printer?
  end

  before_save do |cash|
    cash.done! unless cash.owner.has_fiscal_printer?
  end

  before_destroy do
#    raise _("Cannot destroy this object") #TODO fix it
  end

  def validate
    if self.date != Date.today
      self.errors.add(:date, _('You cannot schedule an add cash'))
    end

    if self.value >= 0
      self.errors.add(:value, _('The value must be minor or equal to 0'))                                
    end

    if self.type_of != Payment::TYPE_OF_EXPENSE
      self.errors.add(:type_of, _('You cannot have an add cash with type different of %s') % Payment::TYPE_OF_EXPENSE)
    end

    if self.printer_command.nil? and self.owner.has_fiscal_printer?
      self.errors.add(_('You cannot add money on till without create the printer command'))
    end

  end

  def initialize(till, *args)
    super(*args)
    self.payment_method = 'money'
    self.type_of = Payment::TYPE_OF_EXPENSE
    self.date = Date.today
    self.bank_account = till.organization.default_bank_account
    self.owner = till
    self.pending!
  end

end
