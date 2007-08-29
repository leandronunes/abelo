class LedgerDisplay < DisplayConfiguration

  def self.available_fields
    %w[
      type
      category_id
      value
      description
      tag_list
      date
      interests
      interests_days
      number_of_parcels
      parcel_number
      operational
      bank_account_id
      is_foreseen
      schedule_ledger_id
     ]
  end

  def self.title_size
    _('Size')
  end

  def self.title_color
    _('Color')
  end

  def self.title_description
    _('Description')
  end

  def self.title_sell_price
    _('Sell Price')
  end

  def self.title_unit
    _('Unit')
  end
  
  def self.title_suppliers
    _('Suppliers')
  end
  
  def self.title_image
    ''
  end



end
