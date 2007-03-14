class Sale < ActiveRecord::Base

  validates_presence_of :date, :organization_id, :user_id

  belongs_to :organization
  belongs_to :customer
  belongs_to :user
  has_many :payments
  has_many :items, :class_name => 'SaleItem'

  STATUS_OPEN = 0
  STATUS_CLOSED = 1
  STATUS_CANCELLED = 2
  STATUS_PAID = 3

  # gives all pending (open) sales for a given organization and user.
  def self.pending(org, user)
    self.find(:all, :conditions => [ 'organization_id = ? AND user_id = ? AND status = ?', org.id, user.id, STATUS_OPEN ])
  end

  # is this sale open?
  def open?
    self.status == STATUS_OPEN
  end

  # was this sale cancelled?
  def cancelled?
    self.status == STATUS_CANCELLED
  end

  # cancels a sale
  #
  # TODO: any further stuff that needs to be done when a sale is cancelled
  def cancel!
    raise ArgumentError.new('Only open sales can be cancelled') if self.status != STATUS_OPEN
    self.status = STATUS_CANCELLED
    self.save
  end

  # closes a sale. No item can be added to it anymore
  #
  # TODO: actually check and stop adding items to a closed sale
  def close!
    raise ArgumentError.new('Only open sales can be closed') if self.status != STATUS_OPEN
    self.status = STATUS_CLOSED
    self.save
  end
  
  # is this sale closed?
  def closed?
    self.status == STATUS_CLOSED
  end

end
