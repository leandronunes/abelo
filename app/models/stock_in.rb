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
      ledger.bank_account = self.organization.default_bank_account unless self.organization.nil?
      ledger.owner = self.organization
      ledger.save
      self.ledger = ledger
      super
    end
  end

  def organization
    self.product.nil? ? nil : self.product.organization
  end

end
