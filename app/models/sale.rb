class Sale < ActiveRecord::Base

  STATUS_OPEN = 0
  STATUS_CANCELLED = 2
  STATUS_CLOSED = 1  # total or parcial credit

  ALL_STATUS = [ STATUS_OPEN,STATUS_CANCELLED, STATUS_CLOSED ]

  belongs_to :organization
  belongs_to :customer
  belongs_to :salesman, :class_name => 'User', :foreign_key => :user_id
  has_many :payments
  has_many :items, :class_name => 'SaleItem'

  validates_presence_of :date, :organization_id, :user_id
  validates_inclusion_of :status, :in => ALL_STATUS


  def validate
    if !Sale.pending(self.organization, self.salesman).nil? and Sale.pending(self.organization, self.salesman) != self
      errors.add(:status, _('You cannot have two pendings sale'))
    end
  end

  # gives the pending (open) sales for a given organization and user.
  def self.pending(org, user)
    return nil if org.nil? or user.nil?
    self.find(:first, :conditions => [ 'organization_id = ? AND user_id = ? AND status = ?', org.id, user.id, STATUS_OPEN ])
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
  #       See if it's needs to remove all items associated to a coupon in de cancel! action
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

  def total_value
    value = 0.0
    self.items.each{ |i|
      value = value + i.price
    }
    return value
  end

  def customers_products(list_products, org)
    customers = []
    self.items.each { |i|
      if list_products.include?(i.product_id.to_s)
        customers.push(org.customers.find(self.customer_id))
      end
    }
    return customers
  end

end
