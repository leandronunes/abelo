class Till < ActiveRecord::Base

  include Status

  belongs_to :user
  belongs_to :organization
  has_many :printer_commands, :as => :owner, :dependent => :destroy
  has_many :ledgers, :as => :owner, :dependent => :destroy
  has_one :printer_command, :as => :owner
  has_many :sales, :as => :owner, :dependent => :destroy

  validates_inclusion_of :status, :in => ALL_STATUS

  before_validation do |till|
    till.printer_command ||= PrinterCommand.new(till, [PrinterCommand::SUMMARIZE]) if till.has_fiscal_printer?
  end

  delegate :default_bank_account, :to => :organization

  def validate
    pendings = self.class.find(:all, :conditions => {:status => STATUS_PENDING, :organization_id => self.organization, :user_id => self.user})
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
    self.datetime = DateTime.now
    self.organization = organization
    self.user = user
    self.printer_id = printer
  end

  def self.load(organization, user, printer_id = nil)
    self.find(:first, :conditions => {:user_id => user, :organization_id => organization, :printer_id => printer_id, :status => STATUS_PENDING})
  end

  def has_fiscal_printer?
    self.organization.has_fiscal_printer? if self.organization
  end

  def save_and_print
   was_save = self.save
   return was_save unless self.has_fiscal_printer? or not was_save
   self.printer_command.execute()
  end

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
