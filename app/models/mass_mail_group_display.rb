class MassMailGroupDisplay < DisplayConfiguration

  def self.available_fields
    ['name']
  end

  def self.describe(field)
    {
      'name' => _('Name'),
    } [field] || field
  end

end
