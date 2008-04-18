class StockBuy < Stock

  validates_presence_of :invoice_id
  validates_presence_of :supplier_id
  validates_presence_of :price
  validates_numericality_of :price
  validates_inclusion_of :amount, :in => InfiniteSet::POSITIVES, :if => lambda { |s| !s.amount.nil? } , :message => _('The amount must be a positive number')

  belongs_to :supplier
  belongs_to :invoice

  before_validation do |stock|
    unless stock.invoice.nil?
      stock.date = stock.invoice.issue_date 
      stock.supplier = stock.invoice.supplier
    end
  end

  def price= value
    value ||= 0
    value = value.kind_of?(String) ? (value.gsub!('.', ''); value.gsub(',','.')) : value
    self[:price] = value
  end

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
