class LedgerDisplay < DisplayConfiguration

  def self.available_fields
    %w[
      category_id
      payment_method
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
      status
      schedule_repeat
      schedule_periodicity_id
      schedule_interval
     ]
  end

  DESCRIBE_AVAILABLE_FIELDS = 
    {
      'category_id' => _('Category'),
      'payment_method' => _('Payment Method'),
      'value' => _('Value'),
      'description' => _('Description'),
      'tag_list' => _('Tag List'),
      'date' => _('Date'),
      'interests' => _('Interests'),
      'interests_days' => _('Periodicity of Intersts'),
      'number_of_parcels' => _('Number of Parcels'),
      'parcel_number' => _('Parcel Number'),
      'operational' => _('Is Operational?'),
      'bank_account_id' => _('Bank Account'),
      'status' => _('Is foreseen'),
      'schedule_repeat' => _('Repeat Schedule?'),
      'schedule_periodicity_id' => _('Periodicity of Schedule'),
      'schedule_interval' => _('Interval fo Schedule'),
      'CreditLedger' => _('Credit'),
      'F' => _('No'),
    }

  def self.describe(field)
     DESCRIBE_AVAILABLE_FIELDS[field] || field
  end

end
