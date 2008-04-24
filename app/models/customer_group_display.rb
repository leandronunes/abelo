class CustomerGroupDisplay < MassMailGroupDisplay

  def self.available_fields
    ['name', 'customers']
  end

end
