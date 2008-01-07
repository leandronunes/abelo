class Till < ActiveRecord::Base

  include Status

  belongs_to :user
  belongs_to :organization
  has_many :printer_commands, :dependent => :destroy
  has_many :add_cashs, :as => :owner, :dependent => :destroy
  has_one :printer_command, :as => :owner
  has_many :sales, :as => :owner, :dependent => :destroy

  validates_inclusion_of :status, :in => ALL_STATUS

  before_validation do |till|
    till.printer_command ||= PrinterCommand.new(till, [PrinterCommand::SUMMARIZE]) if till.organization and till.organization.has_fiscal_printer?
  end

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

  def has_fiscal_printer?
    self.organization.has_fiscal_printer? if self.organization
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

  def accept_printer_cmd!(command)
    self.status = STATUS_DONE
    self.save!
  end

  def printer_cmd_accept?
    self.status == STATUS_DONE
  end

  def close
    if self.has_fiscal_printer?
      p = PrinterCommand.new(self, [PrinterCommand::CLOSE_TILL, false] )
      p.owner = self
      self.printer_commands << p
    else
      self.status = STATUS_DONE
      self.save
    end
  end

end
