module MassMailsHelper

  def select_categories(mass_mail)
    mass_mail.organization.customer_categories.map { |s|
      content_tag(
        'div',
        check_box_tag("categories[#{s.id}]", 1) + s.name
      )
    }.join("\n")
  end

  def select_products(mass_mail)
    mass_mail.organization.products.map { |s|
      content_tag(
        'div',
        check_box_tag("products[#{s.id}]", 1) + s.name
      )
    }.join("\n")
  end

  def select_customers(customers)  
    customers.map { |s|
      content_tag(
        'div',
        check_box_tag("customers[#{s.id}]", 1) + s.name
      )
    }.join("\n")
  end

  def select_groups(recipient_type)  
    groups = MassMailGroup.find_by_recipient_type(recipient_type)
    groups.map { |g|
      content_tag(
        'div',
        check_box_tag("groups[#{g.id}]", 1) + g.name
      )
    }.join("\n")
  end

end
