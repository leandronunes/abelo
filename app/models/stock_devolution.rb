class StockDevolution < Stock

  validates_inclusion_of :amount, :in => InfiniteSet::POSITIVES, :if => lambda { |s| !s.amount.nil? } , :message => _('The amount must be a positive number')

  before_validation do |stock|
    stock.amount = stock.amount * -1 if stock.amount < 0
  end

end
