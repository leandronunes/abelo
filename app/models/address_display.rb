class AddressDisplay < DisplayConfiguration

  def self.available_fields
    ['city', 'state', 'country', 'street', 'number', 'complement', 'district', 'zip_code']
  end

  def self.describe(field)
    {
      'city' => I18n.t(:city),
      'state' =>  I18n.t(:state),
      'country' => I18n.t(:country),
      'street' => I18n.t(:street),
      'number' => I18n.t(:number),
      'complement' => I18n.t(:complement),
      'district' => I18n.t(:district),
      'zip_code' => I18n.t(:zip_code),
    }[field] || field
  end

  def self.break_lines
    []
  end

end
