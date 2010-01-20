class BalanceDisplay < DisplayConfiguration

  def self.available_fields
    %w[
        bank_account
        value
        date
     ]
  end

  def self.describe(field)
    {
      'value' => t(:value),
      'date' => t(:date),
      'bank_account' => t(:bank_account),
    }[field] || field
  end


end
