class Ledger < ActiveRecord::Base

  acts_as_taggable

  attr_accessor :schedule_repeat, :schedule_periodicity, :schedule_interval

  belongs_to :category, :class_name => 'LedgerCategory',  :foreign_key => 'category_id'
  belongs_to :schedule_ledger
  belongs_to :bank_account

  validates_presence_of :category_id
  validates_presence_of :foreseen_value
  validates_presence_of :effective_value, :if => lambda{|ledger| not ledger.is_foreseen? }

  validates_presence_of :foreseen_date
  validates_presence_of :effective_date, :if => lambda{|ledger| not ledger.is_foreseen? }

  def save
    if self[:type].blank? && !self.category.nil?
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

  protected
  def validate
    errors.add(:value, _("should be at least 0.01" )) if value.nil? || value <= 0.00
    errors.add(:date, _("Date cannot be set" )) unless self[:date].nil?
  end

  def type= value
    errors.add(:type, _("You cannot set a type manually") )
  end

end
