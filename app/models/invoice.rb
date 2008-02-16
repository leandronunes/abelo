class Invoice < ActiveRecord::Base

  validates_presence_of :number
  validates_presence_of :serie
  validates_presence_of :supplier_id
  validates_presence_of :issue_date

  belongs_to :supplier
  belongs_to :organization
  has_many :stock_ins, :dependent => :destroy
  has_many :ledgers, :as => :owner, :dependent => :destroy

  acts_as_ferret :remote => true

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    self.find_by_contents(q, options)
  end

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
