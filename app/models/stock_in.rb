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

class StockIn < StockEntry

  belongs_to :supplier
  validates_presence_of :supplier_id, :price
  validates_numericality_of :price
  validates_inclusion_of :ammount, :in => InfiniteSet::POSITIVES, :if => lambda { |entry| !entry.ammount.nil? }

  def total_cost
    self.ammount * self.price
  end

end
