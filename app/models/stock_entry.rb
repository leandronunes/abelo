class StockEntry < ActiveRecord::Base

  belongs_to :product
  validates_presence_of :product_id, :purpose, :date, :ammount
  validates_inclusion_of  :purpose, :in => %w( sell production )

  def validate
    if self.validity && (self.validity < self.date)
      self.errors.add('validity', '%{fn} is before this entry date. A invalid product cannot enter the stock.')
    end
  end

end
