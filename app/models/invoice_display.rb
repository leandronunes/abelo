class InvoiceDisplay < DisplayConfiguration

  def self.available_fields
    ['number', 'serie', 'supplier_id', 'issue_date', 'status']
  end

  def self.describe(field)
  {
   'number' => I18n.t(:invoice_number),
   'serie' => I18n.t(:serie), 
   'supplier_id' => I18n.t(:supplier),
   'issue_date' => I18n.t(:invoice_issue_date),
   'status' => I18n.t(:situação)
  }[field] || field
  end

end
