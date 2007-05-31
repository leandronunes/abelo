class CashFlow < ActiveRecord::Base
  belongs_to :historical
  belongs_to :organization
  belongs_to :specification

  def add_stock_entry(entry_id)
    entry = StockIn.find(entry_id)
    self.date = entry.date
    self.value = entry.price

    h = Historical.new
    h.name = "stock entry of #{entry.product.description}"
    h.type_of = TypeTransaction::DEBIT
    h.operational = true
    h.organization = entry.organization
    h.save
    self.historical = h
   
    s = Specification.new
    s.name = entry.supplier.name
    s.organization = entry.organization
    s.save
    self.specification = s

    self.organization = entry.organization
    self.save
  end

end
