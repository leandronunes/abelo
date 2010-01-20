class PrinterDisplay < DisplayConfiguration

  def self.available_fields
    ['serial', 'computer_id', 'name']
  end

  def self.describe(field)
    {
      'name' => t(:name),
      'serial' => t(:serial),
      'computer_id' =>  t(:computer),
    }[field] || field
  end

end
