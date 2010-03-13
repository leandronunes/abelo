class StockOut < Stock

  has_many :ledgers, :as => :owner

  validates_inclusion_of :amount, :in => InfiniteSet::NEGATIVES, :if => lambda { |entry| !entry.amount.nil? }

  before_create do |stock|
    stock.status = Status::STATUS_OPEN
  end

  before_validation do |stock|
    stock.amount = stock.amount * -1 if stock.amount > 0
  end

  def done!
    self.status = Status::STATUS_DONE
    self.save
  end

  def validate
    if self.product && self.amount
      total = self.product.amount_in_stock || 0
      if self.amount.abs > total
        self.errors.add('amount', I18n.t(:amount_must_not_be_larger_than_the_total_amount_of_this_product_in_stock))
      end
    end
  end

  def cancel!
    self.status = Status::STATUS_CANCELLED
    self.save
  end

end
