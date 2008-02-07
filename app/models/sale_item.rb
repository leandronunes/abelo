class SaleItem < ActiveRecord::Base

  include Status
  require 'codenames'

  #TODO validate when we made a paymente cannot add more items

  attr_accessor :item_product_code

  belongs_to :sale
  belongs_to :product
  belongs_to :stock_out, :class_name => 'StockOut', :foreign_key => :stock_id, :dependent => :destroy
  has_one :printer_command, :as => :owner, :dependent => :destroy

  validates_presence_of :sale_id, :product_id, :amount, :unitary_price, :stock_out
  validates_inclusion_of :status, :in => ALL_STATUS

  before_validation do |sale_item|
    sale_item.unitary_price = sale_item.product.sell_price unless sale_item.product.nil?
    sale_item.product ||= sale_item.sale.organization.products.find_by_code(sale_item.product_code)
    sale_item.stock_out ||= StockOut.new
    sale_item.stock_out.date = Date.today
    sale_item.stock_out.product = sale_item.product
    sale_item.stock_out.amount = sale_item.amount
    sale_item.printer_command = PrinterCommand.new(sale_item.sale.owner, 
        [
          PrinterCommand::ADD_ITEM, sale_item.code,  
          sale_item.description, sale_item.unitary_price, sale_item.taxcode,
          sale_item.amount, sale_item.unit, sale_item.discount,
          sale_item.surcharge, sale_item.unit_desc
        ])

  end

  before_create do |item|
    item.cmd_sent! if item.has_fiscal_printer?
  end

  delegate :has_fiscal_printer?, :to => :sale

  def validate
    if self.unitary_price <= 0
      self.errors.add(:unitary_price, _('The price must be greater than 0'))
    end

    if !self.sale.nil? and !self.sale.organization.products.include?(self.product)
      self.errors.add(:product_id, _("You cannot add a item with the product code %s") % self.product_code)
    end

    if self.has_fiscal_printer? and (self.printer_command.nil? or !PrinterCommand.pending_command(self.sale.owner).nil?)
      self.errors.add(:printer_command, _('You have pending add item commands.'))
    end
  end

  def initialize(sale, *args)
    super(*args)
    self.sale = sale
  end

  # Set the status of this item for OPEN. It means that the
  # fiscal printer command was sent to the printer.
  def cmd_sent!
    self.status = STATUS_OPEN
  end

  # Set the current status of the item to pending. It means that 
  # the fiscal printer received and print the fiscal printer add
  # item command.
  def cmd_received!(cmd = nil)
    self.status = STATUS_PENDING
  end

  def cancel!
    self.status = STATUS_CANCELLED
    self.stock_out.cancel!
    self.save
  end

  def done!
    self.status = STATUS_DONE
    self.stock_out.done!
    self.save
  end

  # This function load a valid product with the code passed
  def product_code= code
    self.product = Product.find_by_code(code) 
    self.item_product_code = code
  end

  def product_code
    self.product.nil? ? self.item_product_code : self.product.code
  end

  def surcharge
    0
  end

  def unit_desc
    'un'
#    self.product.nil? ? '' : self.product.unit
  end

  def unit
    'un'
#    self.product.nil? ? '' : self.product.unit
  end

  def discount
    0
  end

  def taxcode
    'T08'
  end

  def code
    self.product_code
  end

  def description
    str_desc = (self.product.nil? ? '' : (self.product.description || self.product.name))
    str_desc.transliterate
  end

  def amount= amount
    self[:amount] = amount unless amount.nil?
  end

  def name
    self.product.name unless self.product.nil?
  end

  def price
    self.unitary_price * self.amount
  end

  def self.products_by_sale(sales)
    sale_itens = []
    if sales.kind_of?(Array)
      sales.each do |sale|
        sale_itens = sale_itens + SaleItem.find(:all, :conditions =>{:sale_id => sale})
      end
    else
      sale_itens = SaleItem.find(:all, :conditions =>{:sale => sale})
    end

    products = sale_itens.map do |item|
      item.product
    end 
    products.uniq
  end

  private

  def unitary_price= price
    raise "You cannot access this method"
  end

end
