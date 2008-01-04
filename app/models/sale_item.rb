class SaleItem < ActiveRecord::Base

  include Status
  require 'codenames'

  #TODO validate when we made a paymente cannot add more items

  attr_accessor :item_product_code

  belongs_to :sale
  belongs_to :product
  has_one :printer_command, :as => :owner

  validates_presence_of :sale_id, :product_id, :amount, :unitary_price
  validates_inclusion_of :status, :in => ALL_STATUS

  # Important: I load the product here too because the user can't wait to the ajax association before
  # the method 'product_code=' sets the product of the item
  before_validation do |sale_item|
    sale_item.unitary_price = sale_item.product.sell_price unless sale_item.product.nil?
    sale_item.product ||= sale_item.sale.organization.products.find_by_code(sale_item.product_code)
  end

  after_create do |item|
    item.printer_command = PrinterCommand.new(item.sale.owner, 
        [
          PrinterCommand::ADD_ITEM, item.code,  
          item.description, item.unitary_price, item.taxcode,
          item.amount, item.unit, item.discount,
          item.surcharge, item.unit_desc
        ])

  end

  def validate
    if self.unitary_price <= 0
      self.errors.add(:unitary_price, _('The price must be greater than 0'))
    end

    if !self.sale.organization.products.include?(self.product)
      self.errors.add(:product_id, _("You cannot add a item with the product code %s") % self.product_code)
    end
  end

  def initialize(sale, *args)
    super(*args)
    self.sale = sale
  end

  def cancel!
    self.status = STATUS_CANCELLED
    self.save
  end

  def accept_printer_cmd!(command)
    self.status = STATUS_DONE
    self.save!
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
    'T01'
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
