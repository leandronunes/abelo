class StockIn < Stock

  belongs_to :supplier
  validates_presence_of :supplier_id
  validates_presence_of :ledger_id 
  validates_presence_of :validity
  validates_inclusion_of :amount, :in => InfiniteSet::POSITIVES, :if => lambda { |entry| !entry.amount.nil? } 

  def total_cost
    self.amount * self.price
  end
  def save
    self.ledger ||= Ledger.new_ledger
    transaction do
      ledger = self.ledger
      ledger.date = self.date
      ledger.value = self.price
      ledger.bank_account = Organization.find(1).default_bank_account
      ledger.owner = Organization.find(1)
      ledger.save
      self.ledger = ledger
      super
    end
  end


end
