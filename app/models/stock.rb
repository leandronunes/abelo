class Stock < ActiveRecord::Base

  belongs_to :product
  belongs_to :organization
  delegate :organization, :to => :product
  validates_presence_of :product_id
  validates_presence_of :date
  validates_presence_of :amount
  validates_numericality_of :amount

  def default_bank_account
    self.product.nil? ? nil : self.product.organization.default_bank_account
  end

  def self.describe(class_name)
    {
      'StockBuy' => _('Buy'),
      'StockIn' => _('Stock Replenishment'),
      'StockOut' => _('Sell'),
      'StockDown' => _('Stock Down'),
      'StockDevolution' => _('Devolution'),
    }[class_name] || class_name
  end

  def price= value
    value ||= 0
    value = value.kind_of?(String) ? (value.gsub!('.', ''); value.gsub(',','.')) : value
    self[:price] = value
  end

  def amount= value
    value ||= 0
    value = value.kind_of?(String) ? (value.gsub!('.', ''); value.gsub(',','.')) : value
    self[:amount] = value
  end


end
