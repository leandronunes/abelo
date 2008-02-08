class AddressDisplay < DisplayConfiguration

  def self.available_fields
    ['city', 'state', 'country', 'street', 'number', 'complement', 'district', 'zip_code']
  end

  def self.describe(field)
    {
      'city' => _('City'),
      'state' =>  _('State'),
      'country' => _('Country'),
      'street' => _('Street'),
      'number' => _('Number'),
      'complement' => _('Complement'),
      'district' => _('District'),
      'zip_code' => _('Zip Code'),
    }[field] || field
  end

  def self.break_lines
    []
  end

end
