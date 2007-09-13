class LedgerCategory < ActiveRecord::Base

  has_many :ledgers, :foreign_key => 'category_id', :dependent => :delete_all
  belongs_to :organization
  
  TYPE_OF = {'I' => _('Income'), 'O' => _('Expense')}
  
  # Constant used to identifier income financial ledgers  
  TYPE_OF_INCOME = 'I'

  # Constant used to identifier expense financial ledgers  
  TYPE_OF_EXPENSE = 'O'

  validates_presence_of :name
  validates_presence_of :type_of
  validates_presence_of :payment_method
  validates_inclusion_of :payment_method, :in => Payment::PAYMENT_METHODS
  validates_presence_of :organization_id
  validates_uniqueness_of :name
  validates_inclusion_of :type_of, :in => TYPE_OF.keys

  serialize :settings

  def settings
    self[:settings] ||= {}
  end

  def is_store
    self.settings['is_store']
  end

  def is_store= value
    value = value == 'true' ? true : false
    self.settings['is_store'] = value
  end

  def is_operational
    self.settings['is_operational']
  end

  def is_operational= value
    value = value == 'true' ? true : false
    self.settings['is_operational'] = value
  end


  # Check if the current ledger is a income
  def income?
    self.type_of == 'I'
  end

  # Check if the current ledger is a expense
  def expense?
    type_of == 'O'
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
