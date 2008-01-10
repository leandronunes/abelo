class PrinterCommand < ActiveRecord::Base

  include Status
  SEPARATOR = ' '

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
    self.cmd + (self.cmd_params.blank? ? '' : (SEPARATOR + self.cmd_params))
  end

  def self.pending_command(till)
    self.find(:first, :conditions => {:till_id => till, :status => STATUS_PENDING}, :order => 'sequence_number')
  end

  def self.has_pending?(till)
    self.find(:first, :conditions => {:till_id => till, :status => STATUS_PENDING}) != nil
  end

  def self.run_pending(till)
    self.pending_command(till).execute
  end

  def has_error?
    self.error == true
  end

  def inc_counter
    self.counter = self.counter + 1
    self.save
  end

  def execute
    if self.counter >= 3 
      self.error_message = _("The system can't connect to the printer.")
      return self
    end
    exec =  IO.popen("python #{RAILS_ROOT}/lib/fiscal_printer/run.py #{self.str_command}")
    puts "RRRRRRRRRRRRRRRRRRRRUUUUUUUUUUUUUUUUUNNNNNNNNNNNNNNNNN %s" % self.str_command
    self.inc_counter
    response = exec.readlines
    self.parse_response(response)
  end

  def done!
    self.status = STATUS_DONE
    self.error = nil 
    self.save
  end

  def error_message= msg
    self.error = true
    self.error_msg = msg
  end

  def error_message
    self.error_msg
  end

  def parse_response(response)
    case(response)
      when OutofPaperError:
        self.error_message = _("You don't have paper. Change the bobine")
      when  PrinterOfflineError:
        self.error_message = 'ble'
      when AlmostOutofPaper:
        self.error_message = 'ble'
      when HardwareFailure:
        self.error_message = 'ble'
      when PendingReduceZ:
        self.error_message = 'ble'
      when PendingReadX:
        self.error_message = 'ble'
      when CloseCouponError:
        self.error_message = 'ble'
      when CouponNotOpenError:
        self.error_message = 'ble'
      when CouponOpenError:
        self.error_message = 'ble'
      when AuthenticationFailure:
        self.error_message = 'ble'
      when CommandParametersError:
        self.error_message = 'ble'
      when CommandError:
        self.error_message = 'ble'
      when  ClosedTillError:
        self.error_message = 'ble'
      when ReduceZError:
        self.error_message = 'ble'
      when ReadXError:
        self.error_message = 'ble'
      when CouponTotalizeError:
        self.error_message = 'ble'
      when PaymentAdditionError:
        self.error_message = 'ble'
      when CancelItemError:
        self.error_message = 'ble'
      when  InvalidState:
        self.error_message = 'ble'
      when CapabilityError:
        self.error_message = 'ble'
      when ItemAdditionError:
        self.error_message = 'ble'
      when InvalidReply:
        self.error_message = 'ble'
      when  AlreadyTotalized:
        self.error_message = 'ble'
      when InvalidValue:
        self.error_message = 'ble'
      when CommandOK:
        puts response.inspect 
        self.done!
        return self
      else
        puts "RESSSSPONNNNNNNNNNNNNSSSSSSSSSSSSSSSEEEEEEEEEEEEEE"
        puts response.inspect     
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

    attr_accessor :error
    attr_accessor :error_msg

end
