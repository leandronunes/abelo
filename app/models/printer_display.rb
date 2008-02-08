class PrinterDisplay < DisplayConfiguration

  def self.available_fields
    ['serial', 'computer_id', 'name']
  end

  def self.describe(field)
    {
      'name' => _('Name'),
      'serial' => _('Serial'),
      'computer_id' =>  _('Computer'),
    }[field] || field
  end

end
