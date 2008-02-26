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
      'value' => _('Value'),
      'date' => _('Date'),
      'bank_account' => _('Bank Account'),
    }[field] || field
  end


end
