class LedgerCategory < ActiveRecord::Base

  include TypeOfLedger

  validates_presence_of :type_of
  validates_inclusion_of :type_of, :in => TYPE_OF

  has_many :ledgers, :foreign_key => 'category_id', :dependent => :delete_all
  belongs_to :organization
  
  validates_presence_of :name
  validates_presence_of :organization_id
  validates_uniqueness_of :name

  serialize :settings

  def destroy
    self.ledgers.count != 0 ? false : super
  end

  def validate
    if self.payment_methods.length < 1
      self.errors.add('payment_methods', _('You have to choose at least one payment method'))
    end
            
    if (self.payment_methods - PAYMENT_METHODS).length != 0 
      self.errors.add('payment_methods', _('You have to choose a valid payment method'))
    end
  end

  def settings
    self[:settings] ||= {}
  end

  def is_store
    self.settings['is_store']
  end

  def is_store= value
    value = value.to_s == 'true' ? true : false
    self.settings['is_store'] = value
  end

  def is_operational
    self.settings['is_operational']
  end

  def is_operational= value
    value = value.to_s == 'true' ? true : false
    self.settings['is_operational'] = value
  end

  def payment_methods= value
    self.settings['payment_methods'] = value
  end

  def payment_methods
    self.settings['payment_methods'] || []
  end

  def foreseen_value_by_date(date = Date.today)
    ledgers = self.ledgers.select{|l| l.date.month == date.month}
    value = 0
    ledgers.collect{|l| value = value + l.foreseen_value }
    value
  end

  def effective_value_by_date(date = Date.today)
    ledgers = self.ledgers.select{|l| !l.is_foreseen? and l.date.month == date.month}
    value = 0
    ledgers.collect{|l| value = value + l.effective_value }
    value
  end

  def name_with_sign
    self.income? ? _("(+) %s") % self.name :  _("(-) %s") % self.name
  end

  def count_ledgers
    self.ledgers.count
  end

end
