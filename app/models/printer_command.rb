class PrinterCommand < ActiveRecord::Base

  include Status
  SEPARATOR = ';'

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
    self.pending_commands(till).collect{|cmd| cmd.execute}
  end

  # Check if a sale was totalized
  def self.is_totalized? sale
    sale.printer_commands.find(:first, :conditions => {:cmd => TOTALIZE } ) != nil
  end

  def has_error?
    self.error == true
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
    if self.counter >= 3 
      return self
    end
    exec =  IO.popen("python #{RAILS_ROOT}/lib/fiscal_printer/run.py #{self.str_command}")
    puts "RRRRRRRRRRRRRRRRRRRRUUUUUUUUUUUUUUUUUNNNNNNNNNNNNNNNNN %s" % self.str_command
    self.inc_counter
    response = exec.readlines
    puts "RESSSSSSSPOOOOOOOOOOOOOOOOONNNNNNNNNNNNNNNNNNSSSSSSSSSSSSSEEEEEEEEEEEEEEE %s" % response.inspect
    self.parse_response(response)
  end

  def done!
    self.status = STATUS_DONE
    self.error_code = nil 
    self.save
  end


  def set_error(code, msg)
    self.error_code = code
    self.error_msg = msg
    self.save
  end  

  def error_message
    return self.error_msg unless self.error_msg.nil?
    return nil if self.error_code.nil?
    self.dec_counter
    self.execute
    self.error_msg
#    self.response_error?([self.error_code]) 
#    self.error_msg
  end

  def response_error?(response)
    code = response[0]
    msg = response[1]
    case(code.to_i)
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
        msg ||= 'ble 4'
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
      else
        return false
    end

    return true
  end

  def parse_response(response)
    if !self.response_error?(response)
      self.done!
      return self
    end
    pending_cmd = PrinterCommand.pending_command(self.till)
    if pending_cmd.nil?
      return self
    else
      return pending_cmd.execute()
    end
  end

  def make_reduction_z
#    pc = self.class.has_pending_cmd(self.till, PrinterCommand::CLOSE_TILL)
    pc ||= PrinterCommand.new(self.till, [PrinterCommand::CLOSE_TILL, false]) #FIXME see if it's previous day or not
#    pc ||= PrinterCommand.new(self.till, [PrinterCommand::CLOSE_TILL, ((self.datetime < Date.today) ? false : true)]) #FIXME see if it's previous day or not
#TODO refactoring this    
    pc.owner = self.till
    pc.save
    self.class.set_as_first(pc)
  end

#  def self.has_pending_cmd(till, command)
#    self.pending_commands(till).detect{ |c| c.cmd == command}
#  end

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


  protected

    attr_accessor :error_msg

end
