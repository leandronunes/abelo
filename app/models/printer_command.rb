class PrinterCommand < ActiveRecord::Base
  include Status
  SEPARATOR = ';'
  COMMAND_SEPARATOR = '#'

  belongs_to :till
  belongs_to :owner, :polymorphic => true
  validates_inclusion_of :status, :in => ALL_STATUS

  before_save do |printer_command|
    if printer_command.sequence_number.nil?
      current_sequence_number = PrinterCommand.maximum(:sequence_number, :conditions => {:till_id => printer_command.till}) || 0
      printer_command.sequence_number ||= current_sequence_number + 1
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
    command.sequence_number.to_s + SEPARATOR + command.cmd + (command.cmd_params.blank? ? '' : (SEPARATOR + command.cmd_params))
  end

  def str_command
    self.sequence_number.to_s + SEPARATOR + self.cmd + (self.cmd_params.blank? ? '' : (SEPARATOR + self.cmd_params))
  end

  def self.str_pending_command(till)
    make_command(pending_command(till))
  end

  def self.pending_command(till)
    self.find(:first, :conditions => {:till_id => till, :status => STATUS_PENDING}, :order => 'sequence_number')
  end

  def self.find_pending_by_sequence_number(till, sequence_number)
    self.find(:first, :conditions => {:till_id => till, :status => STATUS_PENDING, :sequence_number => sequence_number})  
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

  def action_error(error_code)
    {
      TILL_ADD_CASH => {'100' => 'till_open'},
      TILL_REMOVE_CASH => { '101' => 'till_open'},
      SUMMRIZE => {'102' => 'till_open'},
      CLOSE_TILL => {'100' => 'till_open'},
      CLOSE => {'100' => 'till_open'},
      CANCEL => {'100' => 'till_open'},
      OPEN => {'100' => 'till_open'},
      ADD_ITEM => {'100' => 'till_open'},
      ADD_PAYMENT => {'100' => 'till_open'},
    }[self.cmd][error_code]
  end

end
