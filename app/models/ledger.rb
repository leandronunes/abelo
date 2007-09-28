class Ledger < ActiveRecord::Base

  include TypeOfLedger

  acts_as_taggable

  acts_as_ferret
  
  attr_accessor :schedule_repeat, :schedule_interval, :payment_method_choosen
  @schedule_periodicity


  belongs_to :category, :class_name => 'LedgerCategory',  :foreign_key => 'category_id'
  belongs_to :schedule_ledger
  belongs_to :bank_account
  belongs_to :owner, :polymorphic => true
  validates_presence_of :owner
  validates_presence_of :category_id
  validates_presence_of :foreseen_value
  validates_presence_of :effective_value, :if => lambda{ |ledger| not ledger.is_foreseen? }
  validates_presence_of :bank_account_id
  validates_presence_of :foreseen_date
  validates_presence_of :effective_date, :if => lambda{ |ledger| not ledger.is_foreseen? }
  validates_presence_of :schedule_repeat, :if => lambda{ |l| !l.schedule_periodicity.blank? or  !l.schedule_interval.blank? }
  validates_presence_of :schedule_periodicity, :if => lambda{ |l| l.schedule_repeat? or !l.schedule_interval.blank? }
  validates_presence_of :schedule_interval, :if => lambda{ |l| l.schedule_repeat? or  !l.schedule_periodicity.blank? }
  validates_inclusion_of :payment_method, :in => PAYMENT_METHODS
  validates_presence_of :type_of
  validates_inclusion_of :type_of, :in => TYPE_OF

  before_validation do |l|
    l.type_of = l.category.type_of unless l.category.nil?
  end

  after_create do |l|

    transaction do 
      if l.schedule_repeat?
        sl = ScheduleLedger.create(:periodicity => l.schedule_periodicity, :start_date => l.foreseen_date, :interval => l.schedule_interval)
        (1..l.schedule_interval.to_i).each do |n|
          ledger_schedule = l.clone
          ledger_schedule.is_foreseen = true
          ledger_schedule.date = l.date + l.schedule_periodicity.number_of_days * n
          ledger_schedule.schedule_ledger = sl
          ledger_schedule.payment_method = l.payment_method
          ledger_schedule.save
        end
        l.schedule_ledger = sl
        l.save
      end  
    end
  end

  def payment_method= value
    self.payment_method_choosen= value
  end

  def payment_method
    (self.payment_method_choosen.nil? and self.class != Ledger ) ? self.class.to_s.tableize.singularize : self.payment_method_choosen
  end

  def reload
    Ledger.find(self.id)
  end

  @@original_new = self.method(:new)
  def self.new(*args)
    (self == Ledger) ? (raise "cannot create an instance of Ledger") : super(*args)
  end

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


  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    self.find_by_contents(q, options)
  end
  
  def schedule_periodicity= value
    @schedule_periodicity = value
  end

  alias :schedule_periodicity_id= :schedule_periodicity=
  def schedule_periodicity_id
    @schedule_periodicity
  end

  def schedule_periodicity
    Periodicity.find(@schedule_periodicity) unless @schedule_periodicity.blank?
  end

  def value= value
    self[:foreseen_value] = self.is_foreseen? ? (value) : (self[:foreseen_value] || value)
    self[:effective_value] = value unless self.is_foreseen? 
  end

  def value
    value = self.is_foreseen == true ? self[:foreseen_value] :  self[:effective_value]
    value ||= 0
  end

  def date
    self.is_foreseen? ? self[:foreseen_date] : self[:effective_date]
  end

  def date= date  
    self[:foreseen_date] = date
    self[:effective_date] = date unless self.is_foreseen?
  end

#  #This method cannot be access directly. 
#  #You have to access the date method and this method
#  #set the correct value of effective_date attribute
#  def effective_date= date
#    raise _('This function cannot be accessed directly')
#  end
#
#  #This method cannot be access directly. 
#  #You have to access the date method and this method
#  #set the correct value of foreseen_date attribute
#  def foreseen_date= date
#    raise _('This function cannot be accessed directly')
#  end
#
#
#  #This method cannot be access directly. 
#  #You have to access the value method and this method
#  #set the correct value of effective_value attribute
#  def effective_value= value
#    raise _('This function cannot be accessed directly')
#  end
#
#  #This method cannot be access directly. 
#  #You have to access the value method and this method
#  #set the correct value of foreseen_value attribute
#  def foreseen_value= value
#    raise _('This function cannot be accessed directly')
#  end

  def schedule_repeat?
    self.schedule_repeat.to_s == 'true' ? true : false
  end

#FIXME 
# Until the protected methods we have to remove this methods of here to the module
# TypeOfLedger in lib
  def self.describe_payment(item)
    {
      'check' => _('Check'),
      'credit_card' => _('Credit Card'),
      'debit_card' => _('Debit Card'),
      'money' => _('Money')
    }[item] || item
  end


  def self.describe(item)
    {
      'I' => _('Income'),
      'E' => _('Expense')
    }[item] || item
  end

  protected
  def validate
    if !(self.class == Money) and !(self.class == Check) and !(self.class == CreditCard) and !(self.class == DebitCard)
      self.errors.add(:type, _('You must specify the ledger as Money, Check, Credit Card or Debit Card.'))
    end

    self.errors.add(:value, _("The value should be at least 0.01" )) if value.nil? || value <= 0.00

    self.errors.add(:date, _("Date cannot be set" )) unless self[:date].nil?

    self.errors.add(:payment_method, _("You don't have a payment method associated to this ledger.")) if self.payment_method.blank?

    if !self.category.nil? and !self.category.payment_methods.include?(self.payment_method)
      self.errors.add(:payment_method, _("You canno't have a payment method not include in payment category list.")) 
    end
  end

  private

  def self.instanciate_ledger(*args)
    @@original_new.call(*args)
  end

end
