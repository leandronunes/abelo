class SaleItem < ActiveRecord::Base

  include Status

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

  after_create do |sale_item|
    sale_item.printer_command = PrinterCommand.new(sale_item.sale.owner, [PrinterCommand::ADD_ITEM])
  end

  def validate
#FIXME I have to validates this?
#    if !self.sale.organization.product_ids.include?(self.product.id)
#      self.errors.add(:product_id, _("You cannot add a item with the product with id: %s") % self.product.id)
#    end
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
    self.product = self.sale.organization.products.find_by_code(code) unless self.sale.nil?
    self.item_product_code = code
  end

  def product_code
    self.product.nil? ? self.item_product_code : self.product.code
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
