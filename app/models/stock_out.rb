# == Schema Information
# Schema version: 35
#
# Table name: stock_entries
#
#  id             :integer       not null, primary key
#  type           :string(255)   not null
#  product_id     :integer       not null
#  ammount        :float         not null
#  purpose        :string(255)   not null
#  date           :date          not null
#  supplier_id    :integer       
#  price          :float         
#  validity       :date          
#  payment_status :boolean       
#  sell_id        :integer       
#

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

  def total_cost
    0.0
  end

end
