class Sale < ActiveRecord::Base

  include Status

  belongs_to :organization
  belongs_to :customer
  belongs_to :salesman, :class_name => 'User', :foreign_key => :user_id
  belongs_to :owner, :polymorphic => true
  has_many :printer_commands, :as => :owner, :dependent => :destroy
  has_many :items, :class_name => 'SaleItem', :dependent => :destroy
  has_many :ledgers, :as => :owner, :dependent => :delete_all

  validates_presence_of :datetime, :organization_id, :user_id
  validates_inclusion_of :status, :in => ALL_STATUS

  after_create do |sale|
    sale.printer_commands << PrinterCommand.new(sale.owner, [PrinterCommand::OPEN])
  end

  def validate
    pending = Sale.pending(self.owner)
    pending ||= self
    if pending != self
      errors.add(:status, _('You cannot have two pendings sale'))
    end
  end

  def initialize(till, *args)
    super(*args)
    self.organization = till.organization
    self.salesman = till.user
    self.owner = till
    self.datetime = Time.now
  end

  def accept_printer_cmd!(command)
    self.status = STATUS_DONE if command.cmd == PrinterCommand::CLOSE

    if command.cmd == PrinterCommand::CANCEL
      self.status = STATUS_CANCELLED
      transaction do 
        self.items.map{|i| i.cancel!}
        self.ledgers.map{|l| l.cancel!}
      end
    end
    self.save!
  end

  def self.sale_ledgers_by_customer(customer)
    sales = self.sale_by_customer(customer)
    sales.collect{|s| s.ledgers}.flatten
  end

  def self.sale_by_customer(customer)
    Sale.find(:all, :conditions => {:organization_id => customer.organization, :customer_id => customer })
  end

  def self.products_by_customer(customer)
    sales = self.sale_by_customer(customer)
    return SaleItem.products_by_sale(sales)
  end 

  def amount_consumed_by_product(product)
    self.items.find(:all, :conditions => {:product_id => product}).sum(&:amount).to_f
  end 

  # gives the pending (open) sales for a given organization and user.
  def self.pending(till)
    return nil if till.nil?
    self.find(:first, :conditions => {:owner_id => till.id, :owner_type => till.class.class_name, :status => STATUS_PENDING} )
  end

  # is this sale open?
  def open?
    self.status == STATUS_PENDING
  end

  # was this sale cancelled?
  def cancelled?
    self.status == STATUS_CANCELLED
  end

  # Cancels a sale
  def cancel!
    if self.status != STATUS_PENDING
      self.errors.add('status', _('Only open sales can be cancelled')) 
      return false
    end
    if self.owner.has_fiscal_printer?
      self.printer_commands << PrinterCommand.new(self.owner, [PrinterCommand::CANCEL])
    else
      self.status = STATUS_CANCELLED
      self.save
    end
  end

  # closes a sale. No item can be added to it anymore
  #
  # TODO: actually check and stop adding items to a closed sale
  # TODO: see if sale with no item need a payment
  def close!
    raise ArgumentError.new('Only open sales can be closed') if self.status != STATUS_PENDING
    self.status = STATUS_DONE  if self.balance == 0
    self.save
  end
  
  # is this sale closed?
  def closed?
    self.status == STATUS_DONE
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

  def customer_identifier
    self.customer.cpf unless self.customer.nil?
  end

  def customer_description
    self.customer.nil? ? _('None') :  self.customer.name
  end


#TODO remove this if it's don't needed
#  def reload
#    Sale.find(self.id)
#  end

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
