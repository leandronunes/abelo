class Ledger < ActiveRecord::Base

  acts_as_taggable

  attr_accessor :schedule_repeat, :schedule_periodicity, :schedule_interval

  belongs_to :category, :class_name => 'LedgerCategory',  :foreign_key => 'category_id'
  belongs_to :schedule_ledger
  belongs_to :bank_account
  validates_presence_of :category_id

  def save
    if self[:type].blank? && !self.category.nil?
      self[:type] = self.category.income? ? 'CreditLedger' : 'DebitLedger'
    end
    super
  end

  def value= value
    self.is_foreseen? ?  self[:foreseen_value] = value :  self[:effective_value] = value
  end

  def value
    self.is_foreseen == true ? self[:foreseen_value] :  self[:effective_value]
  end

  def date
#    self.is_foreseen == true ? self[:foreseen_date] :  
    self[:effective_date]
  end

  #TODO see if it's needed
  def self.find_all_ordened(options = {})
    options.merge! :order => 'ledgers.effective_date DESC, ledgers.id DESC'
    self.find :all, options
  end

   
  #TODO see if it's needed
  def self.sum_by_month(category_id, time = Time.now)
    date_init = time.at_beginning_of_month
    date_end  = time.months_since(1).at_beginning_of_month

    results = self.find_by_sql ["select sum(value) as total_ledgers from ledgers where ledgers.effective_date >= ? and ledgers.effective_date < ? and ledgers.category_id = ?", date_init, date_end, category_id]

    unless results.empty? || results.first.total_ledgers.nil?
      Float(results.first.total_ledgers)
    else
      nil
    end
  end

  protected
  def validate
    errors.add(:value, _("should be at least 0.01" )) if value.nil? || value <= 0.00
  end

  def type= value
    errors.add(:type, _("You cannot set a type manually") )
  end

  private

  def effective_value= value
    self[:effective_value] = value.to_s.gsub(/,/,'.') 
  end

  def foreseen_value= value
    self[:foreseen_value] = value.to_s.gsub(/,/,'.') 
  end

end
