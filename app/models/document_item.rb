class DocumentItem < ActiveRecord::Base
  validates_presence_of :quantity
  validates_presence_of :unitary_value
  validates_presence_of :document_section_id
  belongs_to :product
  belongs_to :document_section

  def total_value
    quantity * unitary_value
  end

  def description
    self.product.description if self.product 
  end

  def validate
    filled = [:product_id, :service_id].find_all { |i| self.send(i) != nil }
    if filled.length != 1
      self.errors.add(I18n.t(:none_a_type_of_item_chosen))
    end
  end

end
