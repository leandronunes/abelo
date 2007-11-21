class SaleItem < ActiveRecord::Base

  #TODO validate when we made a paymente cannot add more items

  attr_accessor :product_code

  belongs_to :sale
  belongs_to :product

  validates_presence_of :sale_id, :product_id, :amount, :unitary_price

  alias :active_record_set_product :product=

  def product_code
    self.product.code unless self.product.nil?
  end

  # Besides assigning the product to this sale item, this method also fills the
  # <tt>unitary_price</tt> attribute (so we save in the sale item the sell
  # price that was current at the time of the sale).
  def product=(product)
    active_record_set_product(product)
    self.unitary_price = self.product.sell_price unless self.product.nil?
  end

  # Same as @product=, but for when setting the <tt>product_id</tt> attribute
  # directly.
  def product_id=(id)
    self[:product_id] = id
    self.unitary_price = self.product.sell_price
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

end
