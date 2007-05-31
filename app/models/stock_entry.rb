class StockEntry < ActiveRecord::Base

  belongs_to :product
  belongs_to :organization, :include => :product
  delegate :organization, :organization=, :to => :product
  validates_presence_of :product_id, :purpose, :date, :ammount
  validates_numericality_of :ammount

  @valid_purposes = {
    'sell' => _('Sell'),
    'production' => _('Production')
  }
  def self.valid_purposes
    @valid_purposes
  end
  validates_inclusion_of  :purpose, :in => self.valid_purposes.keys

  def validate
    if self.validity && (self.validity < self.date)
      self.errors.add('validity', '%{fn} is before this entry date. A invalid product cannot enter the stock.')
    end
  end

end
