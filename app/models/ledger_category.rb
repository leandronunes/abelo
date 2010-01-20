class LedgerCategory < ActiveRecord::Base

  validates_presence_of :type_of
  validates_inclusion_of :type_of, :in => Payment::TYPE_OF

  has_many :ledgers, :foreign_key => 'category_id', :dependent => :delete_all
  belongs_to :organization
  belongs_to :periodicity
  
  validates_presence_of :name
  validates_presence_of :organization_id
  validates_uniqueness_of :name, :scope => :organization_id

  serialize :settings
  delegate :default_bank_account, :to => :organization

  def destroy
    self.ledgers.count != 0 ? false : super
  end

  def validate
    if self.payment_methods.length < 1
      self.errors.add('payment_methods', t(:you_have_to_choose_at_least_one_payment_method))
    end
            
    if (self.payment_methods - Payment::PAYMENT_METHODS.keys).length != 0 
      self.errors.add('payment_methods', t(:you_have_to_choose_a_valid_payment_method))
    end

    if self.is_sale? and !self.income?
      self.errors.add(:is_sale, _("The sale operations must be type of income"))
    end

    if self.is_stock? and !self.expense?
      self.errors.add(:is_stock, _("The stock operations must be type of expense"))
    end

    if self.is_stock? and self.is_sale?
      self.errors.add(:is_stock, _("You canno't have a payment category sale an stock at the same time"))
    end

  end

  # Return true if the ledger category in type of income
  def income?
    self.type_of == Payment::TYPE_OF_INCOME
  end

  # Return true if the ledger category in type of expense
  def expense?
    self.type_of == Payment::TYPE_OF_EXPENSE
  end

  def settings
    self[:settings] ||= {}
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
    ledgers = self.ledgers.select{|l| !l.pending? and l.date.month == date.month}
    value = 0
    ledgers.collect{|l| value = value + l.effective_value }
    value
  end

  def name_with_sign
    Payment.income?(self.type_of) ? _("(+) %s") % self.name :  _("(-) %s") % self.name
  end

  def count_ledgers
    self.ledgers.count
  end

end
