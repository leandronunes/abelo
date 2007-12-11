class Ledger < ActiveRecord::Base

  include Status
  acts_as_taggable

  acts_as_ferret :fields => ['description', 'category', 'tags']
  
  attr_accessor :schedule_repeat, :schedule_interval, :payment_method_choosen
  @schedule_periodicity

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
  validates_presence_of :schedule_repeat, :if => lambda{ |l| !l.schedule_periodicity.blank? or  !l.schedule_interval.blank? }
  validates_presence_of :schedule_periodicity, :if => lambda{ |l| l.schedule_repeat? or !l.schedule_interval.blank? }
  validates_presence_of :schedule_interval, :if => lambda{ |l| l.schedule_repeat? or  !l.schedule_periodicity.blank? }
  validates_inclusion_of :payment_method, :in => Payment::PAYMENT_METHODS
  validates_presence_of :type_of
  validates_inclusion_of :type_of, :in => Payment::TYPE_OF
  validates_presence_of :owner_id

  before_validation do |l|
    l.type_of = l.category.type_of unless l.category.nil?
    l.effective_value ||= l.foreseen_value unless l.pending?
    l.effective_date ||= l.foreseen_date unless l.pending?
  end

  after_create do |l|
    if l.owner.kind_of?(Sale)
      sale = l.owner
      l.printer_command = PrinterCommand.new(l.owner.owner, [PrinterCommand::ADD_PAYMENT, sale.value])
    end

    transaction do 
      if l.schedule_repeat?
        sl = ScheduleLedger.create(:periodicity => l.schedule_periodicity, :start_date => l.foreseen_date, :interval => l.schedule_interval)
        (1..l.schedule_interval.to_i).each do |n|
          ledger_schedule = l.clone
          ledger_schedule.pending!
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

  def accept_printer_cmd!(command)
    self.status = STATUS_DONE 
    if self.owner.balance == 0
      self.owner.close!
    end
    self.save!
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
#  def self.new(*args)
#    (self == Ledger) ? (raise "cannot create an instance of Ledger") : super(*args)
#  end

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
    self[:foreseen_date] = date
    self[:effective_date] = date unless self.pending?
  end

  def cancel!
    self.status = STATUS_CANCELLED
    self.save
  end

  def cancel?
    self.status == STATUS_CANCELLED
  end

  def done!
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

  def schedule_repeat?
    self.schedule_repeat.to_s == 'true' ? true : false
  end

  protected
  def validate

    self.errors.add(:value, _("The value should be at least 0.01" )) if value.nil? || value <= 0.00

    self.errors.add(:date, _("Date cannot be set" )) unless self[:date].nil?

    self.errors.add(:payment_method, _("You don't have a payment method associated to this ledger.")) if self.payment_method.blank?

    if !self.category.nil? and !self.category.payment_methods.include?(self.payment_method)
      self.errors.add(:payment_method, _("You canno't have a payment method not include in payment category list.")) 
    end
   
    # Ledgers of sales must have values minor or equal the sale value
    if((self.owner.kind_of?(Sale)) and(self.owner.ledgers.include?(self) ? (self.owner.balance < 0) : (self.owner.balance - self.value < 0)))
      self.errors.add(:value, _('The value must be minor or equal to %s') % self.owner.balance)
    end
  end

  private

  def self.instanciate_ledger(*args)
    @@original_new.call(*args)
  end

end
