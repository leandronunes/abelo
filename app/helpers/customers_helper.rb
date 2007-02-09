module CustomersHelper
  
  def select_categories(customer)
    customer.organization.customer_categories.map { |s|
      content_tag(
        'div',
        check_box_tag("customer_categories[#{s.id}]", 1, customer.customer_categories.include?(s)) + s.name
      )
    }.join("\n")
  end

end
