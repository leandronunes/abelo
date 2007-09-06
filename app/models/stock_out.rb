class StockOut < StockEntry

  validates_inclusion_of :ammount, :in => InfiniteSet::NEGATIVES, :if => lambda { |entry| !entry.ammount.nil? }

  def validate
    if self.product && self.ammount
      total = self.product.ammount_in_stock || 0
      if self.ammount.abs > total
        self.errors.add('ammount', '%{fn} must not be larger than the total ammount of this product in stock (which is %d).' % total)
      end
    end
  end

  def self.configuration_class
    StockOutDisplay
  end

end
