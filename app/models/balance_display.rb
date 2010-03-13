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
      'value' => I18n.t(:value),
      'date' => I18n.t(:date),
      'bank_account' => I18n.t(:bank_account),
    }[field] || field
  end


end
