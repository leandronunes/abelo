class StockIn < StockEntry

  belongs_to :supplier
  validates_presence_of :supplier_id, :price
  validates_numericality_of :price
  validates_inclusion_of :amount, :in => InfiniteSet::POSITIVES, :if => lambda { |entry| !entry.amount.nil? }

  def total_cost
    self.amount * self.price
  end

  def supplier_name
    self.supplier.name
  end

end
