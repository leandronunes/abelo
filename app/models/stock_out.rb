class StockOut < StockEntry

  validates_inclusion_of :ammount, :in => InfiniteSet::NEGATIVES, :if => lambda { |entry| !entry.ammount.nil? }

end
