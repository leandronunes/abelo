class LedgerCategory < ActiveRecord::Base
  has_many :ledgers, :foreign_key => 'category_id', :dependent => :delete_all
  
  TYPE_OF = {'I' => _('Income'), 'O' => _('Expense')}
  TYPE_OF_INCOME = 'I'
  TYPE_OF_EXPENSE = 'O'

  validates_presence_of :name, :type_of, :organization_id
  validates_uniqueness_of :name
  validates_length_of :name, :maximum=>15
  validates_inclusion_of :type_of, :in => TYPE_OF.keys
  belongs_to :organization

  def income?
    self.type_of == 'I'
  end

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


# TODO see if it's needed
  def value
    0
  end

  def sum_ledgers
#    ledgers.sum('value')
    30
  end

  def count_ledgers
    self.ledgers.count
  end

end
