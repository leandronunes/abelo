class PrinterDisplay < DisplayConfiguration

  def self.available_fields
    ['serial', 'computer_id', 'name']
  end

  def self.describe(field)
    {
      'name' => I18n.t(:name),
      'serial' => I18n.t(:serial),
      'computer_id' =>  I18n.t(:computer),
    }[field] || field
  end

end
