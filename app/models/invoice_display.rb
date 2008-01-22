class InvoiceDisplay < DisplayConfiguration

  def self.available_fields
    ['number', 'serie', 'supplier_id', 'issue_date', 'status']
  end

  def self.describe(field)
  {
   'number' => _('Invoice number'),
   'serie' => _('Serie'), 
   'supplier_id' => _('Supplier'),
   'issue_date' => _('Invoice Issue Date'),
   'status' => _('Situação')
  }[field] || field
  end

end
