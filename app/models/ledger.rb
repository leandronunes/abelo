class Ledger < ActiveRecord::Base

  include Status
  acts_as_taggable

  acts_as_ferret :fields => ['description', 'category', 'tags']
  
  attr_accessor :repeat, :interval, :periodicity_id, :payment_method_choosen

  belongs_to :category, :class_name => 'LedgerCategory',  :foreign_key => 'category_id'
  belongs_to :schedule_ledger
  belongs_to :bank_account
  belongs_to :owner, :polymorphic => true
  has_one :printer_command, :as => :owner
  validates_presence_of :foreseen_value
  validates_presence_of :effective_value, :if => lambda{ |ledger| not ledger.pending? }
  validates_presence_of :bank_account_id
  validates_presence_of :foreseen_date
  validates_presence_of :effective_date, :if => lambda{ |ledger| not ledger.pending? }
  validates_presence_of :schedule_repeat, :if => lambda{ |l| !l.schedule_periodicity_id.blank? or  !l.schedule_interval.blank? }
  validates_presence_of :schedule_periodicity, :if => lambda{ |l| l.schedule_repeat? or !l.schedule_interval.blank? }
  validates_presence_of :schedule_interval, :if => lambda{ |l| l.schedule_repeat? or  !l.schedule_periodicity_id.blank? }
  validates_inclusion_of :payment_method, :in => Payment::PAYMENT_METHODS
  validates_presence_of :type_of
  validates_inclusion_of :type_of, :in => Payment::TYPE_OF
  validates_presence_of :owner_id
  validates_presence_of :owner_type

  def validate

    self.errors.add(:value, _("The value should be at least 0.01" )) if value.nil? || value <= 0.00

    self.errors.add(:date, _("Date cannot be set" )) unless self[:date].nil?

    self.errors.add(:payment_method, _("You don't have a payment method associated to this ledger.")) if self.payment_method.blank?

    if !self.category.nil? and !self.category.payment_methods.include?(self.payment_method)
      self.errors.add(:payment_method, _("You canno't have a payment method not include in payment category list.")) 
    end
  end

  before_validation do |l|
    l.type_of = l.category.type_of unless l.category.nil?
    l.effective_value ||= l.foreseen_value unless l.pending?
    l.effective_date ||= l.foreseen_date unless l.pending?
  end

  after_create do |l|
    if l.owner.kind_of?(Sale)
      sale = l.owner
      l.printer_command = PrinterCommand.new(sale.owner, [PrinterCommand::ADD_PAYMENT, l.fiscal_payment_type, l.payment_type, l.value])
    end

    if l.schedule_repeat? and !l.scheduled?
      sl = ScheduleLedger.create(:periodicity => l.schedule_periodicity, :start_date => l.date, :interval => l.schedule_interval)
      for n in 1..l.schedule_interval.to_i do
        ledger_schedule = l.dclone
        ledger_schedule.pending!
        ledger_schedule.date = (l.date.kind_of?(Time) ? l.date.to_datetime : l.date) + l.schedule_periodicity.number_of_days * n
        ledger_schedule.schedule_ledger = sl
        ledger_schedule.payment_method = l.payment_method
        ledger_schedule.save
      end
      l.schedule_ledger = sl
      l.save
    end
   
    if !l.category.nil? and l.category.number_of_parcels > 1 and !l.scheduled?
      sl = ScheduleLedger.create(:periodicity => l.category.periodicity, :start_date => l.date, :interval => l.category.number_of_parcels)
      l.value = l.value / l.category.number_of_parcels
      l.number_of_parcels = l.category.number_of_parcels
      l.parcel_number = 1
      l.save
      for n in 1..(l.category.number_of_parcels-1) do
        ledger_schedule = l.dclone
        ledger_schedule.pending!
        ledger_schedule.date = (l.date.kind_of?(Time) ? l.date.to_datetime : l.date) + 30 * n
        ledger_schedule.schedule_ledger = sl
        ledger_schedule.payment_method = l.payment_method
        ledger_schedule.save
      end
    end
  end

  before_destroy do |ledger|
    raise _('You cannot destroy sale ledgers') if ledger.owner.kind_of? Sale
  end

  after_destroy do |ledger|
    unless ledger.schedule_ledger.nil?
      all_pending = ledger.schedule_ledger.pending_ledgers
      all_pending.delete(ledger)
      ledger.schedule_ledger.destroy if all_pending.blank?
    end
  end

  def dclone
    l = self.clone
    l.tag_list = self.tag_list.names
    l
  end

  def schedule_repeat
    self.schedule_ledger.nil? ? self.repeat : true
  end

  def schedule_repeat= value
    self.repeat = (value.to_s == 'true' ? true : false  )
  end

  def schedule_repeat?
    self.schedule_repeat.to_s == 'true' ? true : false
  end

  def scheduled?
    self.schedule_ledger.nil? ? false : true
  end

  def schedule_interval
    self.schedule_ledger.nil? ? self.interval : self.schedule_ledger.interval
  end

  def schedule_interval= value
    self.interval = value
  end

  def ledgers_scheduled
    return nil if self.schedule_ledger.nil?
    self.schedule_ledger.ledgers.select{|l| l != self}
  end

  def unschedule!
    return nil if self.schedule_ledger.nil?
    self.schedule_ledger.ledgers.delete(self)
  end

  def unschedule_all!
    s = self.schedule_ledger
    self.unschedule!
    s.destroy
  end

  def fiscal_payment_type
    00
  end

  def payment_type
    self.class.to_s.tableize.singularize
  end

  def payment_method= value
    self.payment_method_choosen= value
  end

  def payment_method
    self.payment_method_choosen
  end

  def reload
    Ledger.find(self.id)
  end

  @@original_new = self.method(:new)

  def self.create_ledger!(*args)
    object = self.new_ledger(*args)
    object.save!
    object
  end

  def self.new_ledger(*args)
    l = Ledger.instanciate_ledger(*args)
    klass = l.payment_method.nil? ? 'money' : l.payment_method
    klass = klass.camelize.constantize
    object = klass.new(*args)
    object.type_of =  l.category.type_of unless l.category.nil?
    object
  end

  # Return the sum of tha values of ledgers passed as parameter
  def self.total_income(ledgers)
    total = 0
    ledgers.collect{ |l| total = total + (l.income? ? l.value : 0) }
    total
  end

  # Return the sum of tha values of ledgers passed as parameter
  def self.total_expense(ledgers)
    total = 0
    ledgers.collect{ |l| total = total + (l.expense? ? l.value : 0) }
    total
  end


  # Check if the current ledger is a income
  def income?
    self.type_of == Payment::TYPE_OF_INCOME
  end

  # Check if the current ledger is a expense 
  def expense?
    self.type_of == Payment::TYPE_OF_EXPENSE
  end

  # Search for ledgers that contain any data that match with the 
  # query passed as first arguments. 
  # As the second argument some options can be passed, the options 
  # are those permited by acts_as_ferret plugin
  #
  # EX: 
  #   
  #   Ledger.full_text_search('car', :limit => 2)
  #
  # The example above  will return 2 (two) ledgers which contains
  # the word 'car' in his field
  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    self.find_by_contents(q, options)
  end
  
  def schedule_periodicity_id= value
    self.periodicity_id = value
  end

  def schedule_periodicity_id
    self.schedule_ledger.nil? ? self.periodicity_id : self.schedule_ledger.periodicity_id
  end

  def schedule_periodicity= value
    self.schedule_periodicity_id=  value.kind_of?(Periodicity) ? value.id : value
  end

  def schedule_periodicity
    if self.schedule_ledger.nil? 
      self.organization.periodicities.find(self.schedule_periodicity_id) unless self.organization.nil? or self.schedule_periodicity_id.blank?
    else
      self.schedule_ledger.periodicity
    end
  end

  def organization
    self.owner if self.owner.kind_of?(Organization)
  end

  def value= value
    self[:foreseen_value] = self.pending? ? (value.kind_of?(String) ? value.gsub(',', '.') : value) : (self[:foreseen_value] || (value.kind_of?(String) ? value.gsub(',', '.') : value))
    self[:effective_value] = value unless self.pending? 
  end

  def value
    value = self.pending? ? self[:foreseen_value] :  self[:effective_value]
    value ||= 0
  end

  def date
    self.pending? ? self[:foreseen_date] : self[:effective_date]
  end

  def date= date  
    self.pending? ? self[:foreseen_date] = date : self[:foreseen_date] ||= date
    self[:effective_date] = date unless self.pending?
  end

  def cancel!
    self.status = STATUS_CANCELLED
  end

  def cancel?
    self.status == STATUS_CANCELLED
  end

  def confirm_cancel!
    self.cancel!
    self.save
  end

  def confirm_done!
    self.done!
    self.save
  end

  def done!
    self.effective_date ||= self.foreseen_date
    self.effective_value ||= self.foreseen_value
    self.status = STATUS_DONE
  end

  def done?
    self.status == STATUS_DONE
  end

  def pending!
    self.status = STATUS_PENDING
  end

  def pending?
    self.status == STATUS_PENDING
  end

#  #This method cannot be access directly. 
#  #You have to access the date method and this method
#  #set the correct value of foreseen_date attribute
  def foreseen_date= date
    raise _('This function cannot be accessed directly')
  end

#  #This method cannot be access directly. 
#  #You have to access the value method and this method
#  #set the correct value of foreseen_value attribute
  def foreseen_value= value
    raise _('This function cannot be accessed directly')
  end

  private

  def self.instanciate_ledger(*args)
    @@original_new.call(*args)
  end

end
