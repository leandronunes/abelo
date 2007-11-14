class StockDown < Stock

  validates_inclusion_of :amount, :in => InfiniteSet::NEGATIVES, :if => lambda { |entry| !entry.amount.nil? }

  before_validation do |stock|
    stock.amount = stock.amount * -1 if stock.amount > 0
  end

end
