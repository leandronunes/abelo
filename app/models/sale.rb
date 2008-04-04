class Sale < ActiveRecord::Base

  include Status

  belongs_to :organization
  belongs_to :customer
  belongs_to :salesman, :class_name => 'User', :foreign_key => :user_id
  belongs_to :till
#FIXME remeber to remove this field of migration
#  has_one :change, :as => :owner, :class_name => Ledger.name, :foreign_key => :change_id
  has_many :printer_commands, :as => :owner, :dependent => :destroy
  has_many :sale_items, :dependent => :destroy
  has_many :ledgers, :as => :owner, :dependent => :destroy
  #FIXME This association only works with sale_item. 
  #The correct way is works with sale_items class
  has_many :stock_outs, :through => :sale_items

  validates_presence_of :datetime, :organization_id, :user_id
  validates_inclusion_of :status, :in => ALL_STATUS

  before_create do |sale|
    sale.cmd_sent! if sale.has_fiscal_printer?
  end

  before_save do |sale|
    sale.ledgers.update_all("status = #{sale.status}")
    sale.sale_items.update_all("status = #{sale.status}")
#FIXME This update are not so good. Improve this updates
    sale.stock_outs.collect{ |s|
      s.status = sale.status
      s.save
    }
  end

  after_create do |sale|
    sale.printer_commands << PrinterCommand.new(sale.till, [PrinterCommand::OPEN]) if sale.has_fiscal_printer?
  end

  delegate :has_fiscal_printer?, :default_bank_account, :to => :organization

  def validate
    pending = Sale.pending(self.till)
    if !pending.nil? and pending != self
      self.errors.add(:status, _('You cannot have two pendings sale'))
    end

    opened = Sale.opened(self.till)
    if !opened.nil? and opened != self
      self.errors.add(:status, _('You cannot open a sale with a sale opened'))
    end

  end

  def initialize(*args)
    super(*args)
    till = self.till
    self.organization = till.organization unless till.nil?
    self.salesman = till.user unless till.nil?
    self.datetime = Time.now
  end

  # Set the status of this sale for OPEN. It means that the
  # fiscal printer command was sent to the printer.
  def cmd_sent!
    self.status = STATUS_OPEN
  end

  # Set the current status of the sale to pending. It means that 
  # the fiscal printer received and print the fiscal printer sale
  # command.
  def cmd_received!(cmd = nil)
    if !cmd.nil? and cmd.cmd == PrinterCommand::CANCEL
      self.status = STATUS_CANCELLED
    elsif !cmd.nil? and cmd.cmd == PrinterCommand::CLOSE
      self.status = STATUS_DONE
    else
      self.status = STATUS_PENDING
    end
  end

  def totalize
    if self.has_fiscal_printer? and not PrinterCommand.is_totalized?(self)
      self.printer_commands << PrinterCommand.new(self.till, [PrinterCommand::TOTALIZE]) 
    end
  end

  def self.sale_ledgers_by_customer(customer)
    sales = self.sale_by_customer(customer)
    l = Ledger.find(:all, :conditions => {:owner_type => 'Sale', :owner_id => sales})
  end

  def self.sale_by_customer(customer)
    Sale.find(:all, :conditions => {:organization_id => customer.organization, :customer_id => customer })
  end

  def self.products_by_customer(customer)
    sales = self.sale_by_customer(customer)
    return SaleItem.products_by_sale(sales)
  end 

  def amount_consumed_by_product(product)
    self.sale_items.find(:all, :conditions => {:product_id => product}).sum(&:amount).to_f
  end 

  # gives the pending (open) sales for a given organization and user.
  def self.pending(till)
    return nil if till.nil?
    till.sales.find(:first, :conditions => {:status => STATUS_PENDING})
  end

  # gives the opened (open) sales for a given organization and user.
  def self.opened(till)
    return nil if till.nil?
    till.sales.find(:first, :conditions => {:status => STATUS_OPEN})
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
    self.status = STATUS_CANCELLED
    self.ledgers.collect{|l| l.confirm_cancel!}
    self.sale_items.collect{|i| i.cancel!}
    if self.has_fiscal_printer?
      self.status = STATUS_OPEN
      self.printer_commands << PrinterCommand.new(self.till, [PrinterCommand::CANCEL])
    end
    self.save
  end

  # closes a sale. No item can be added to it anymore
  def close!
    if self.status != STATUS_PENDING
      self.errors.add('status', _('Only open sales can be closed')) 
      return false
    end

    if self.balance != 0
      self.errors.add('value', _('Only sales with balance equal to zero can be closed')) 
      return false
    end

    if self.has_fiscal_printer?
# FIXME see if we need to set the status for open to print the clo command
#      self.status = STATUS_OPEN
      self.printer_commands << PrinterCommand.new(self.till, [PrinterCommand::CLOSE])
      self.save
    else
      self.done!
    end
  end

  def done!
    self.status = STATUS_DONE 
    self.save
  end
  
  # is this sale closed?
  def closed?
    self.status == STATUS_DONE
  end

  # Return the total price of the sale. The total price is
  # the sum of each item of the sale
  def total_value
    value = 0
    self.sale_items.each{ |i|
      value = value + i.price
    }
    value
  end

  # Return the balance between the total value of sale_items and 
  # the total of payments realized
  def balance
    self.total_value - self.total_payment_balance
  end

  # Return the sum of payments of the sale
  # FIXME see this test
  def total_payment
    self.ledgers.sum(:foreseen_value, :conditions => ['payment_method != ?', Payment::CHANGE]) || 0
  end

  #FIXME make this test
  def total_payment_balance
    self.total_payment + self.change_value
  end

  def change!
    return unless self.balance < 0 and self.change.nil?
    l = Ledger.new(:owner => self, :payment_method => Payment::CHANGE, :value => self.balance.abs, :organization => self.organization)
    l.save!
  end

  #FIXME make this test
  def change_value
    self.change.nil? ? 0 : self.change.value
  end

  #FIXME make this test
  def change
    self.ledgers.find(:first, :conditions => {:payment_method => Payment::CHANGE} )
  end

  # Return the identifier of a customer. Now the identifier is the cpf
  def customer_identifier
    self.customer.cpf unless self.customer.nil?
  end

  # Return the customer's name of the sale. If there is no customer on the sale 
  # the string 'None' its returned
  def customer_description
    self.customer.nil? ? _('None') :  self.customer.name
  end

  def customers_products(list_products, org)
    customers = []
    self.sale_items.each { |i|
      if list_products.include?(i.product_id.to_s)
        customers.push(org.customers.find(self.customer_id))
      end
    }
    return customers
  end

end
