class StockIn < StockEntry

  belongs_to :supplier
  validates_presence_of :supplier_id, :price, :payment_status
  validates_numericality_of :price
  validates_inclusion_of :ammount, :in => InfiniteSet::POSITIVES, :if => lambda { |entry| !entry.ammount.nil? }

  def total_cost
    self.ammount * self.price
  end

end
