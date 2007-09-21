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
      schedule_repeat
      schedule_periodicity_id
      schedule_interval
     ]
  end

  def self.describe(field)
    {
      'type' => _('Type'),
      'category_id' => _('Category'),
      'value' => _('Value'),
      'description' => _('Description'),
      'tag_list' => _('Tag List'),
      'date' => _('Date'),
      'interests' => _('Interests'),
      'interests_days' => _('Periodicity of Intersts'),
      'number_of_parcels' => _('Number of Parcels'),
      'parcel_number' => _('Number of Parcels'),
      'operational' => _('Is Operational?'),
      'bank_account_id' => _('Bank Account'),
      'is_foreseen' => _('Is foreseen'),
      'schedule_repeat' => _('Repeat Schedule?'),
      'schedule_periodicity_id' => _('Periodicity of Schedule'),
      'schedule_interval' => _('Interval fo Schedule'),
      'CreditLedger' => _('Credit'),
      'F' => _('No'),
    }[field] || field
  end

end
