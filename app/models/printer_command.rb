class PrinterCommand < ActiveRecord::Base

  include Status
  SEPARATOR = ';'
  MAX_PRINTER_COUNTER = 3

  ##############################
  # COMMAND SET
  ##############################

  TILL_ADD_CASH = 'till_add_cash'
  TILL_REMOVE_CASH = 'till_remove_cash'
  TOTALIZE = 'totalize'
  SUMMARIZE = 'summarize'
  CLOSE_TILL = 'close_till'
  OPEN = 'open'
  CLOSE = 'close'
  CANCEL = 'cancel'
  ADD_ITEM = 'add_item'
  ADD_PAYMENT = 'add_payment'

  #############################
  # Errors Set
  #############################

  CommandOK = 1
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
  DriverError = 124

  belongs_to :till
  belongs_to :owner, :polymorphic => true
  validates_inclusion_of :status, :in => ALL_STATUS
  validates_uniqueness_of :cmd_id, :scope => :till_id
  validates_uniqueness_of :sequence_number, :scope => :till_id

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

  def initialize(till, command, *args)
    super(*args)
    self.till = till
    self.cmd = command.shift
    self.cmd_params = command.join(SEPARATOR)
    self.datetime = DateTime.now
  end

  def str_command
    self.cmd + ' ' + "'#{(self.cmd_params.blank? ? '' : (self.cmd_params))}'"
  end

  def self.pending_command(till)
    self.find(:first, :conditions => {:till_id => till, :status => STATUS_PENDING}, :order => 'sequence_number')
  end

  def self.pending_commands(till)
    self.find(:all, :conditions => {:till_id => till, :status => STATUS_PENDING}, :order => 'sequence_number')
  end

  def self.has_pending?(till)
    self.find(:first, :conditions => {:till_id => till, :status => STATUS_PENDING}) != nil
  end

  def self.run_pendings(till)
    pending_cmd = self.pending_command(till)
    pending_cmd.valid! if pending_cmd.invalid?
    while !pending_cmd.nil? and !pending_cmd.invalid?
      pending_cmd.execute
      pending_cmd = self.pending_command(till)
    end
  end

  # Erase the error counter to make the command 
  # possible to print
  def valid!
    self.counter = 10
  end

  # Return true if the current command is invalid.
  # One command is invalid when the system tried to print 
  # it MAX_PRINTER_COUNTER times unsuccefully.
  def invalid?
    self.counter == MAX_PRINTER_COUNTER
  end

  # Check if a sale was totalized
  def self.is_totalized? sale
    sale.printer_commands.find(:first, :conditions => {:cmd => TOTALIZE } ) != nil
  end

  def has_error?
    self.error_code != nil
  end

  def inc_counter
    self.counter = self.counter + 1
    self.save
  end

  def dec_counter
    self.counter = self.counter - 1
    self.save
  end

  def execute
    if self.counter >= MAX_PRINTER_COUNTER
#      self.owner.destroy unless self.owner.nil? #TODO remove it
      return false
    end
    exec =  IO.popen("python #{RAILS_ROOT}/lib/fiscal_printer/pyro_client.py #{self.str_command}")
    puts "RRRRRRRRRRRRRRRRRRRRUUUUUUUUUUUUUUUUUNNNNNNNNNNNNNNNNN %s" % self.str_command
    self.inc_counter
    response = exec.readlines
    puts "RESSSSSSSPOOOOOOOOOOOOOOOOONNNNNNNNNNNNNNNNNNSSSSSSSSSSSSSEEEEEEEEEEEEEEE %s" % response.inspect
    self.accept_command?(response) ? true : false
  end

  def done!
    self.status = STATUS_DONE
    unless self.owner.nil?
      self.owner.cmd_received!
      self.owner.save
    end
    self.error_code = nil 
    self.error_message = nil
    self.save
  end


  def set_error(code, msg)
    self.error_code = code
    self.error_message = msg
    self.save
  end  

  def response_error?(response)
    response.shift
    code = response[0].to_i
    msg = response[1]

puts "CARRRRRRRRRRRRRRRRRRRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAALLLLLLLLLLLLLLLLLLLHHHHHHHHHHHHHOOOOOOOOOOOO %s %s" % [code, response.inspect]

    case(code)
      when OutofPaperError:
        msg ||= _("You don't have paper. Change the bobine")
        self.set_error(code, msg)
      when  PrinterOfflineError:
        msg ||= 'ble 1'
        self.set_error(code, msg)
      when AlmostOutofPaper:
        msg ||= 'ble 2'
        self.set_error(code, msg)
      when HardwareFailure:
        msg ||= 'ble 3'
        self.set_error(code, msg)
      when PendingReduceZ:
        msg ||= _('Pending Reduction Z')
        make_reduction_z
        self.set_error(code, msg)
      when PendingReadX:
        msg ||= 'ble 5'
        self.set_error(code, msg)
      when CloseCouponError:
        msg ||= 'ble 6'
        self.set_error(code, msg)
      when CouponNotOpenError:
        msg ||= 'ble 7'
        self.set_error(code, msg)
      when CouponOpenError:
        msg ||= 'ble 8'
        self.set_error(code, msg)
      when AuthenticationFailure:
        msg ||= 'ble 9'
        self.set_error(code, msg)
      when CommandParametersError:
        msg ||= 'ble  10'
        self.set_error(code, msg)
      when CommandError:
        self.set_error(code, msg)
      when  ClosedTillError:
        msg ||= 'ble 12'
        self.set_error(code, msg)
      when ReduceZError:
        msg ||= 'ble 13'
        self.set_error(code, msg)
      when ReadXError:
        msg ||= 'ble 14'
        self.set_error(code, msg)
      when CouponTotalizeError:
        msg ||= 'ble 15'
        self.set_error(code, msg)
      when PaymentAdditionError:
        msg ||= 'ble 16'
        self.set_error(code, msg)
      when CancelItemError:
        msg ||= 'ble 17'
        self.set_error(code, msg)
      when  InvalidState:
        msg ||= 'ble 18'
        self.set_error(code, msg)
      when CapabilityError:
        msg ||= 'ble 19'
        self.set_error(code, msg)
      when ItemAdditionError:
        msg ||= 'ble 20'
        self.set_error(code, msg)
      when InvalidReply:
        msg ||= 'ble 21'
        self.set_error(code, msg)
      when  AlreadyTotalized:
        msg ||= 'ble 22'
        self.set_error(code, msg)
      when InvalidValue:
        msg ||= 'ble 23'
        self.set_error(code, msg)
      when DriverError:
        msg ||= 'ble 24'
        self.set_error(code, msg)
      when CommandOK:
        return false
    end

    return true
  end

  def accept_command?(response)
    return false if self.response_error?(response) 
    self.done!
    return true
  end

  def make_reduction_z
    pc ||= PrinterCommand.new(self.till, [PrinterCommand::CLOSE_TILL, false])
#    pc ||= PrinterCommand.new(self.till, [PrinterCommand::CLOSE_TILL, ((self.datetime < Date.today) ? false : true)]) #FIXME see if it's previous day or not
#TODO refactoring this    
    pc.owner = self.till
    self.till.printer_commands<< pc
    pc.set_as_first
  end

  def set_as_first
    self.sequence_number = PrinterCommand.minimum(:sequence_number, :conditions => {:till_id => self.till}) - 1 || 0
    self.save!
  end

end
