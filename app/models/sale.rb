class Sale < ActiveRecord::Base

  validates_presence_of :date, :organization_id, :user_id

  belongs_to :organization
  belongs_to :customer
  belongs_to :user
  has_many :payments
  has_many :items, :class_name => 'SaleItem'

  # TODO: well-closed sales are not pending
  def self.pending(org, user)
    self.find(:all, :conditions => [ 'organization_id = ? AND user_id = ? AND cancelled = ?', org.id, user.id, false ])
  end

  # TODO: any further stuff that needs to be done when a sale is cancelled
  def cancel
    self.cancelled = true
    self.save
  end

end
