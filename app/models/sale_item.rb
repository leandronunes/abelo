class SaleItem < ActiveRecord::Base

  belongs_to :sale
  belongs_to :product

  validates_presence_of :sale_id, :product_id, :amount, :unitary_price

  alias :active_record_set_product :product=

  # Besides assigning the product to this sale item, this method also fills the
  # <tt>unitary_price</tt> attribute (so we save in the sale item the sell
  # price that was current at the time of the sale).
  def product=(product)
    active_record_set_product(product)
    self.unitary_price = self.product.sell_price
  end

  # Same as @product=, but for when setting the <tt>product_id</tt> attribute
  # directly.
  def product_id=(id)
    self[:product_id] = id
    self.unitary_price = self.product.sell_price
  end

  def name
    self.product.name
  end

  def price
    self.unitary_price * self.amount
  end
  
end
