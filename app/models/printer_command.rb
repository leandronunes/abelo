class PrinterCommand < ActiveRecord::Base
  include Status
  SEPARATOR = ';'
  COMMAND_SEPARATOR = '#'

  belongs_to :till
  belongs_to :owner, :polymorphic => true
  validates_inclusion_of :status, :in => ALL_STATUS
  validates_uniqueness_of :cmd_id, :scope => :till_id

  before_save do |printer_command|
    if printer_command.sequence_number.nil?
      current_sequence_number = PrinterCommand.maximum(:sequence_number, :conditions => {:till_id => printer_command.till}) || 0
      printer_command.sequence_number = current_sequence_number + 1
    end

    if printer_command.cmd_id.nil?
      current_cmd_id = PrinterCommand.maximum(:cmd_id, :conditions => {:till_id => printer_command.till}) || 0
      printer_command.cmd_id = current_cmd_id + 1
    end
  end

  def validate
    pending =  self.class.has_pending_cmd(self.till, self.cmd)
    if( !pending.nil? and pending != self)
      self.errors.add(_('You cannot have more than one %s command pending') % self.cmd)
    end
  end

  def initialize(till, command, *args)
    super(*args)
    self.till = till
    self.cmd = command.shift
    self.cmd_params = command.join(SEPARATOR)
    self.datetime = DateTime.now
  end

  def self.make_command(command)
    return '' if command.nil?
    command.cmd_id.to_s + SEPARATOR + command.cmd + (command.cmd_params.blank? ? '' : (SEPARATOR + command.cmd_params))
  end

  def str_command
    self.cmd_id.to_s + SEPARATOR + self.cmd + (self.cmd_params.blank? ? '' : (SEPARATOR + self.cmd_params))
  end

  def self.str_pending_command(till)
    make_command(pending_command(till))
  end

  def self.pending_command(till)
    self.find(:first, :conditions => {:till_id => till, :status => STATUS_PENDING}, :order => 'sequence_number')
  end

  def self.pending_commands(till)
    self.find(:all, :conditions => {:till_id => till, :status => STATUS_PENDING}, :order => 'sequence_number')
  end

  def self.find_pending_by_cmd_id(till, cmd_id)
    self.find(:first, :conditions => {:till_id => till, :status => STATUS_PENDING, :cmd_id => cmd_id})  
  end

  def response_command(response)
    return false if response != '0'

    self.status = STATUS_DONE
    transaction do
      self.owner.accept_printer_cmd!(self) if self.owner.kind_of?(Till) ? (self.cmd == CLOSE_TILL) : true
      self.save!
    end
    true
  end

  ##############################
  # COMMAND SET
  ##############################

  TILL_ADD_CASH = 'till_add_cash'
  TILL_REMOVE_CASH = 'till_remove_cash'
  SUMMARIZE = 'summarize'
  CLOSE_TILL = 'close_till'
  OPEN = 'open'
  CLOSE = 'close'
  CANCEL = 'cancel'
  ADD_ITEM = 'add_item'
  ADD_PAYMENT = 'add_payment'

  def action_success
    {
      TILL_ADD_CASH => 'till_open',
      TILL_REMOVE_CASH => 'till_open',
      SUMMARIZE => 'open_till',
      CLOSE_TILL => 'index',
      OPEN => 'coupon_open',
      CLOSE => 'till_open',
      CANCEL => 'till_open',
      ADD_ITEM => 'coupon_open',
      ADD_PAYMENT => (self.owner.kind_of?(Sale) ? (self.owner.balance == 0 ? 'till_open' : 'coupon_open') : 'till_open' ),
    }[self.cmd]
  end

  def action_error_notice
    _('Some error happen and you have to solve it')
  end

  #############################
  # Errors Set
  #############################

  OutofPaperError = 100
  PrinterOfflineError = 101
  AlmostOutofPaper = 102
  HardwareFailure = 103
  PendingReduceZ = 104
  PendingReadX = 105 
  CloseCouponError = 106
  CouponNotOpenError = 107
  CouponOpenError = 108 
  AuthenticationFailure = 109
  CommandParametersError = 110
  CommandError = 111 
  ClosedTillError = 112
  ReduceZError = 113
  ReadXError = 114
  CouponTotalizeError = 115
  PaymentAdditionError = 116
  CancelItemError = 117
  InvalidState = 118
  CapabilityError = 119
  ItemAdditionError = 120
  InvalidReply = 121
  AlreadyTotalized = 122
  InvalidValue = 123

  def action_error(error_code)
    error_code = error_code.to_i
    action = 'index'
    case( error_code )
      when OutofPaperError
        puts( 'leo' )
      when ReduceZError
        make_reduction_z
        action = 'till_open'
#      when 3 : puts( &#8220;É quarta&#8221; )
#      when 4 : puts( &#8220;É quinta&#8221; )
#      when 5 : puts( &#8220;É sexta&#8221; )
#      when (6..7) : puts( &#8220;Oba! É fim de semana!&#8221; )
    end
    action
  end

  def make_reduction_z
    pc = self.class.has_pending_cmd(self.till, PrinterCommand::CLOSE_TILL)
    pc ||= PrinterCommand.new(self.till, [PrinterCommand::CLOSE_TILL, false]) #FIXME see if it's previous day or not
#    pc ||= PrinterCommand.new(self.till, [PrinterCommand::CLOSE_TILL, ((self.datetime < Date.today) ? false : true)]) #FIXME see if it's previous day or not
    pc.owner = self.till
    pc.save
    self.class.set_as_first(pc)
  end

  def self.has_pending_cmd(till, command)
    self.pending_commands(till).detect{ |c| c.cmd == command}
  end

  def self.set_as_first(printer_command)
    commands = self.pending_commands(printer_command.till)
    transaction do 
      commands.map do |c| 
        c.sequence_number = c.sequence_number + 1 
        c.save
      end
      printer_command.sequence_number = 1
      printer_command.save
    end
  end

end
