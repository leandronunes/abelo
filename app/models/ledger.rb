class Ledger < ActiveRecord::Base

  acts_as_taggable

  acts_as_ferret
  
  attr_accessor :schedule_repeat, :schedule_interval
  @schedule_periodicity

  belongs_to :category, :class_name => 'LedgerCategory',  :foreign_key => 'category_id'
  belongs_to :schedule_ledger
  belongs_to :bank_account

  validates_presence_of :category_id
  validates_presence_of :foreseen_value
  validates_presence_of :effective_value, :if => lambda{ |ledger| not ledger.is_foreseen? }

  validates_presence_of :bank_account_id
  validates_presence_of :foreseen_date
  validates_presence_of :effective_date, :if => lambda{ |ledger| not ledger.is_foreseen? }
  validates_presence_of :schedule_repeat, :if => lambda{ |l| !l.schedule_periodicity.blank? or  !l.schedule_interval.blank? }
  validates_presence_of :schedule_periodicity, :if => lambda{ |l| l.schedule_repeat? or !l.schedule_interval.blank? }
  validates_presence_of :schedule_interval, :if => lambda{ |l| l.schedule_repeat? or  !l.schedule_periodicity.blank? }


  after_create do |l|
    return unless l.valid?
    transaction do 
      if l.schedule_repeat?
        sl = ScheduleLedger.create(:periodicity => l.schedule_periodicity, :start_date => l.foreseen_date, :interval => l.schedule_interval)
        (1..l.schedule_interval.to_i).each do |n|
          ledger_schedule = Ledger.new()
          ledger_schedule.is_foreseen = true
          ledger_schedule.category = l.category
          ledger_schedule.value = l.value
          ledger_schedule.description = l.description
          ledger_schedule.tag_list = l.tag_list.names
          ledger_schedule.date = l.date + l.schedule_periodicity.number_of_days * n
          ledger_schedule.interests = l.interests
          ledger_schedule.interests_days = l.interests_days
          ledger_schedule.number_of_parcels = l.number_of_parcels
          ledger_schedule.parcel_number = l.parcel_number
          ledger_schedule.operational = l.operational
          ledger_schedule.bank_account = l.bank_account
          ledger_schedule.schedule_ledger = sl
          ledger_schedule.save
        end
        l.schedule_ledger = sl
        l.save
      end  
    end
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

  def self.configuration_class
    LedgerDisplay
  end

  def save
    if self.category.nil?
      self[:type] = nil
    else    
      self[:type] = self.category.income? ? 'CreditLedger' : 'DebitLedger'
    end
    super
  end

  def value= value
    self[:foreseen_value] = value
    self[:effective_value] = value unless self.is_foreseen? 
  end

  def value
    self.is_foreseen == true ? self[:foreseen_value] :  self[:effective_value]
  end

  def date
    self.is_foreseen? ? self[:foreseen_date] : self[:effective_date]
  end

  def date= date  
    self[:foreseen_date] = date
    self[:effective_date] = date unless self.is_foreseen?
  end

  #This method cannot be access directly. 
  #You have to access the date method and this method
  #set the correct value of effective_date attribute
  def effective_date= date
    raise _('This function cannot be accessed directly')
  end

  #This method cannot be access directly. 
  #You have to access the date method and this method
  #set the correct value of foreseen_date attribute
  def foreseen_date= date
    raise _('This function cannot be accessed directly')
  end


  #This method cannot be access directly. 
  #You have to access the value method and this method
  #set the correct value of effective_value attribute
  def effective_value= value
    raise _('This function cannot be accessed directly')
  end

  #This method cannot be access directly. 
  #You have to access the value method and this method
  #set the correct value of foreseen_value attribute
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

    self.errors.add(:type, _("It's not a valid type" )) unless self[:type].nil? or self[:type] !='CreditLedger' or self[:type] != 'DebitLedger'
  end

  def type= value
    errors.add(:type, _("You cannot set a type type manually") )
  end

end
