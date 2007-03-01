module CustomersHelper
  
  def select_categories(customer)
    customer.organization.customer_categories.map { |s|
      content_tag(
        'div',
        check_box_tag("customer_categories[#{s.id}]", 1, customer.customer_categories.include?(s)) + s.name
      )
    }.join("\n")
  end
  
  def select_position(object, method)
    contact = self.instance_variable_get("@#{object}")
    positions = contact.customer.organization.contact_positions
    select(object, method, positions.map { |c| [ c.name, c.id ] }.sort { |a,b| a[0] <=> b[0] })
  end

end
