class StockIn < StockEntry

  belongs_to :supplier
  validates_presence_of :supplier_id, :price
  validates_inclusion_of :ammount, :in => InfiniteSet::POSITIVES, :if => lambda { |entry| !entry.ammount.nil? }

end