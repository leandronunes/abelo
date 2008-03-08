class StockDevolution < Stock

  validates_inclusion_of :amount, :in => InfiniteSet::POSITIVES, :if => lambda { |s| !s.amount.nil? } , :message => _('The amount must be a positive number')

  before_validation do |stock|
    stock.amount = stock.amount * -1 if !stock.amount.nil? and stock.amount < 0
    stock.status = Status::STATUS_DONE
  end

  def validates
    self.errors.add(:status, _("You canno't make a devolution with status different of done")) if self.status != Status::STATUS_DONE
  end

end
