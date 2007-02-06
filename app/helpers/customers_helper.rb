module CustomersHelper
  def select_category(object, method)
    customer = self.instance_variable_get("@#{object}")
    categories = customer.organization.customer_categories
    select(object, method, categories.map { |c| [ c.full_name, c.id ] }.sort { |a,b| a[0] <=> b[0] })
  end
end
