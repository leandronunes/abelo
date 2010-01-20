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
      bank_account
      status
      schedule_repeat
      schedule_periodicity_id
      schedule_interval
     ]
  end

  DESCRIBE_AVAILABLE_FIELDS = 
    {
      'category_id' => t(:category),
      'payment_method' => t(:payment_method),
      'value' => t(:value),
      'description' => t(:description),
      'tag_list' => t(:tag_list),
      'date' => t(:date),
      'interests' => t(:interests),
      'interests_days' => t(:periodicity_of_intersts),
      'number_of_parcels' => t(:number_of_parcels),
      'parcel_number' => t(:parcel_number),
      'operational' => t(:is_operational),
      'bank_account' => t(:bank_account),
      'status' => t(:is_foreseen),
      'schedule_repeat' => t(:repeat_schedule),
      'schedule_periodicity_id' => t(:periodicity_of_schedule),
      'schedule_interval' => t(:interval_of_schedule),
      'CreditLedger' => t(:credit),
      'F' => t(:no),
    }

  def self.describe(field)
     DESCRIBE_AVAILABLE_FIELDS[field] || field
  end

end
