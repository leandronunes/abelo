class Stock < ActiveRecord::Base

  belongs_to :product
  belongs_to :organization
  belongs_to :ledger
  delegate :organization, :organization=, :to => :product
  validates_presence_of :product_id
  validates_presence_of :date
  validates_presence_of :amount
  validates_numericality_of :amount

  def validate
    if self.validity && (self.validity < self.date)
      self.errors.add('validity', '%{fn} is before this entry date. A invalid product cannot enter the stock.')
    end
  end

  attr_accessor :product_in_list, :amount_in_list, :buy_payment_method, :buy_value

  def payment_method= value
    self.buy_payment_method= value
  end

  def payment_method
    self.ledger.nil? ? self.buy_payment_method : self.ledger.class.to_s.tableize.singularize
  end

  def value= value
    self.buy_value = value
  end

  def value
    self.ledger.nil? ? self.buy_value : self.ledger.value
  end

end
