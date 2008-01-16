class StockIn < Stock

  belongs_to :supplier
  validates_presence_of :supplier_id
  has_many :ledgers, :as => :owner
  validates_presence_of :price
  validates_numericality_of :price
  validates_inclusion_of :amount, :in => InfiniteSet::POSITIVES, :if => lambda { |s| !s.amount.nil? } , :message => _('The amount must be a positive number')

  def total_cost
    self.amount * self.price
  end

  def validate
    self.errors.add(:price, _("The price should be at least 0.01" )) if self.price.nil? || self.price <= 0.00

    if !self.validity.nil? and ((self.validity.kind_of?(Time) ? self.validity.to_datetime : self.validity) < (self.date.kind_of?(Time) ? self.date.to_datetime : self.date))
      self.errors.add('validity', '%{fn} is before this entry date. A invalid product cannot enter the stock.')
    end
  end

end
