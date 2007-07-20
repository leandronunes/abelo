module CustomersHelper
  
  def select_position(object, method)
    contact = self.instance_variable_get("@#{object}")
    positions = contact.customer.organization.contact_positions
    select(object, method, positions.map { |c| [ c.name, c.id ] }.sort { |a,b| a[0] <=> b[0] })
  end

end
