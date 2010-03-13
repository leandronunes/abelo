class StockDown < Stock

  validates_inclusion_of :amount, :in => InfiniteSet::NEGATIVES, :if => lambda { |entry| !entry.amount.nil? }

  before_validation do |stock|
    stock.amount = stock.amount * -1 if !stock.amount.nil? and stock.amount > 0
    stock.status = Status::STATUS_DONE
  end

  def validate
    if self.product && self.amount
      total = self.product.amount_in_stock || 0
      if self.amount.abs > total
        self.errors.add('amount', I18n.t(:must_not_be_larger_than_the_total_amount_of_this_product_in_stock))
      end
    end
  end


end
