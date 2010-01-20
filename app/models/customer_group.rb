class CustomerGroup < MassMailGroup

  validates_uniqueness_of :name, :scope => [:organization_id], :message => t(:uniqueness_of_customer_name)

  def customers
    self.system_actors
  end

end
