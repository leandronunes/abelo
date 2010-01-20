class AddressDisplay < DisplayConfiguration

  def self.available_fields
    ['city', 'state', 'country', 'street', 'number', 'complement', 'district', 'zip_code']
  end

  def self.describe(field)
    {
      'city' => t(:city),
      'state' =>  t(:state),
      'country' => t(:country),
      'street' => t(:street),
      'number' => t(:number),
      'complement' => t(:complement),
      'district' => t(:district),
      'zip_code' => t(:zip_code),
    }[field] || field
  end

  def self.break_lines
    []
  end

end
