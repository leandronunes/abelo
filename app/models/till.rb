class Till < ActiveRecord::Base

  include Status

  belongs_to :user
  belongs_to :organization
  belongs_to :printer
  has_many :printer_commands, :as => :owner, :dependent => :destroy
  has_many :ledgers, :as => :owner, :dependent => :destroy
  has_one :printer_command, :as => :owner
  has_many :sales, :as => :owner, :dependent => :destroy

  validates_inclusion_of :status, :in => ALL_STATUS
  validates_presence_of :printer_id, :if => lambda { |till| till.has_fiscal_printer?}

  before_validation do |till|
    till.printer_command ||= PrinterCommand.new(till, [PrinterCommand::SUMMARIZE]) if till.has_fiscal_printer?
  end

  before_create do |till|
    till.cmd_sent! if till.has_fiscal_printer?
  end

  delegate :default_bank_account, :to => :organization

  def validate
    pendings = self.class.find(:all, :conditions => {:status => [STATUS_PENDING, STATUS_OPEN], :organization_id => self.organization, :user_id => self.user})
    pendings.delete(self)
    if(!pendings.blank?)
      self.errors.add(_('You already have a till open.'))
    end

    if self.printer_command.nil? and self.has_fiscal_printer?
      self.errors.add(_('You cannot open a till whithout the printer command'))
    end
  end

  def initialize(organization, user, printer, *args)
    super(*args)
    self.datetime = Time.now
    self.organization = organization
    self.user = user
    self.printer = printer
  end

  def self.load(organization, user, printer_id = nil)
    self.find(:first, :conditions => {:user_id => user, :organization_id => organization, :printer_id => printer_id, :status => STATUS_PENDING})
  end

  def self.load_open(organization, user, printer_id = nil)
    self.find(:first, :conditions => {:user_id => user, :organization_id => organization, :printer_id => printer_id, :status => STATUS_OPEN})
  end

  def has_fiscal_printer?
    self.organization.has_fiscal_printer? if self.organization
  end

  def save_and_print
   was_save = self.save
   return was_save unless self.has_fiscal_printer? or not was_save
   self.printer_command.execute()
  end

  # Set the status of this till for OPEN. It means that the
  # fiscal printer command was sent to the printer.
  def cmd_sent!
    self.status = STATUS_OPEN
  end

  # Set the current status of the till to pending. It means that 
  # the fiscal printer received and print the fiscal printer open
  # till command.
  def cmd_received!(cmd = nil)
    self.status = STATUS_PENDING
  end

  # Close the till modifying the status of the till object
  # to status DONE, create the CLOSE_TILL command and run it
  def close
    self.status = STATUS_DONE
    if self.has_fiscal_printer?
      p = PrinterCommand.new(self, [PrinterCommand::CLOSE_TILL, false] )
      self.printer_commands << p
      p.execute
    end
    self.save
  end

end
