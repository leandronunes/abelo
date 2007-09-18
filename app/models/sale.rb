class Sale < ActiveRecord::Base

  attr_accessor :payment_method

  STATUS_OPEN = 0
  STATUS_CLOSED = 1 
  STATUS_CANCELLED = 2

  ALL_STATUS = [ STATUS_OPEN,STATUS_CANCELLED, STATUS_CLOSED ]

  belongs_to :organization
  belongs_to :customer
  belongs_to :salesman, :class_name => 'User', :foreign_key => :user_id
  has_many :items, :class_name => 'SaleItem', :dependent => :delete_all
  has_many :ledgers, :as => :owner, :dependent => :delete_all
  has_many :payments, :through => :ledgers, :as => :owner, :dependent => :delete_all

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
  # TODO: see if sale with no item need a payment
  def close!
    raise ArgumentError.new('Only open sales can be closed') if self.status != STATUS_OPEN
    self.status = STATUS_CLOSED if self.balance == 0
    self.save
  end
  
  # is this sale closed?
  def closed?
    self.status == STATUS_CLOSED
  end

  # Return the total price of the sale. The total price is
  # the sum of each item of the sale
  def total_value
    value = 0.0
    self.items.each{ |i|
      value = value + i.price
    }

    value
  end

  # Return the balance between the total value of items and 
  # the total of payments realized
  def balance
    total_value - total_payment
  end

  # Return the sum of payments of the sale
  def total_payment
    value = 0
    self.ledgers.each{ |l|
      value = value + l.value
    }  
    value #Making the return value more clear
  end

  def reload
    Sale.find(self.id)
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
