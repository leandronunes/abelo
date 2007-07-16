# == Schema Information
# Schema version: 35
#
# Table name: sale_items
#
#  id            :integer       not null, primary key
#  sale_id       :integer       not null
#  product_id    :integer       not null
#  ammount       :float         not null
#  unitary_price :float         not null
#

class SaleItem < ActiveRecord::Base

  validates_presence_of :sale_id, :product_id, :ammount

  belongs_to :sale
  belongs_to :product

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

  def description
    self.product.description
  end

  def price
    self.unitary_price * self.ammount
  end
  
end
