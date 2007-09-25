class StockIn < Stock

  belongs_to :supplier
  validates_presence_of :supplier_id
  validates_presence_of :ledger_id 
  validates_presence_of :validity
  validates_inclusion_of :amount, :in => InfiniteSet::POSITIVES, :if => lambda { |entry| !entry.amount.nil? } 

  def total_cost
    self.amount * self.price
  end

end
