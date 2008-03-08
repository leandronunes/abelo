class StockIn < Stock

  validates_presence_of :supplier_id
  validates_presence_of :price
  validates_numericality_of :price
  validates_inclusion_of :amount, :in => InfiniteSet::POSITIVES, :if => lambda { |s| !s.amount.nil? } , :message => _('The amount must be a positive number')
  has_many :ledgers, :as => :owner

  belongs_to :supplier

  before_validation do |stock|
    stock.status = Status::STATUS_DONE
  end

  # Return the total cost of the buy
  def total_cost
    self.amount * self.price
  end

  #FIXME make this test
  def total_payment
    self.ledgers.sum(:foreseen_value) || 0
  end
  
  # Returns the difference between the total cost and
  # the total payment made, this the the balance.
  #FIXME make this test
  def balance
    self.total_cost + self.total_payment
  end

  def validate
    self.errors.add(:price, _("The price should be at least 0.01" )) if self.price.nil? || self.price <= 0.00

    if !self.validity.nil? and ((self.validity.kind_of?(Time) ? self.validity.to_datetime : self.validity) < (self.date.kind_of?(Time) ? self.date.to_datetime : self.date))
      self.errors.add('validity', '%{fn} is before this entry date. A invalid product cannot enter the stock.')
    end
  end

end
