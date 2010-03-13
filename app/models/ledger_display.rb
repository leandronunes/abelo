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
      'category_id' => I18n.t(:category),
      'payment_method' => I18n.t(:payment_method),
      'value' => I18n.t(:value),
      'description' => I18n.t(:description),
      'tag_list' => I18n.t(:tag_list),
      'date' => I18n.t(:date),
      'interests' => I18n.t(:interests),
      'interests_days' => I18n.t(:periodicity_of_intersts),
      'number_of_parcels' => I18n.t(:number_of_parcels),
      'parcel_number' => I18n.t(:parcel_number),
      'operational' => I18n.t(:is_operational),
      'bank_account' => I18n.t(:bank_account),
      'status' => I18n.t(:is_foreseen),
      'schedule_repeat' => I18n.t(:repeat_schedule),
      'schedule_periodicity_id' => I18n.t(:periodicity_of_schedule),
      'schedule_interval' => I18n.t(:interval_of_schedule),
      'CreditLedger' => I18n.t(:credit),
      'F' => I18n.t(:no),
    }

  def self.describe(field)
     DESCRIBE_AVAILABLE_FIELDS[field] || field
  end

end
