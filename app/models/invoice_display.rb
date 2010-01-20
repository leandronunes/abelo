class InvoiceDisplay < DisplayConfiguration

  def self.available_fields
    ['number', 'serie', 'supplier_id', 'issue_date', 'status']
  end

  def self.describe(field)
  {
   'number' => t(:invoice_number),
   'serie' => t(:serie), 
   'supplier_id' => t(:supplier),
   'issue_date' => t(:invoice_issue_date),
   'status' => t(:situação)
  }[field] || field
  end

end
