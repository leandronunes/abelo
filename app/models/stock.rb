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

end
