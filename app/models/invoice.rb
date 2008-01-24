class Invoice < ActiveRecord::Base

  validates_presence_of :number
  validates_presence_of :serie
  validates_presence_of :supplier_id
  validates_presence_of :issue_date

  belongs_to :supplier
  belongs_to :organization
  has_many :stock_ins, :dependent => :destroy
  has_many :ledgers, :as => :owner, :dependent => :destroy

  def total_cost
    self.stock_ins.sum(:price)
  end

  def total_amount
    self.stock_ins.sum(:amount)
  end

  def total_payment
    self.ledgers.sum(:foreseen_value)
  end

end
