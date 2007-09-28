class Payment < ActiveRecord::Base

  # Constant used to identifier income ledgers  
  TYPE_OF_INCOME = 'I'

  # Constant used to identifier expense ledgers  
  TYPE_OF_EXPENSE = 'E'

  TYPE_OF = [TYPE_OF_INCOME, TYPE_OF_EXPENSE]

  PAYMENT_METHODS = %w[
    check
    credit_card
    debit_card
    money
  ]

  # Check if the current ledger is a income
  def self.income?(type_of)
    type_of == 'I'
  end

  # Check if the current ledger is a expense
  def self.expense?(type_of)
    type_of == 'E'
  end

  def self.describe(item)
    {
      'I' => _('Income'),
      'E' => _('Expense')
    }[item] || item
  end


  def self.describe_payment(item)
    {
      'check' => _('Check'),
      'credit_card' => _('Credit Card'),
      'debit_card' => _('Debit Card'),
      'money' => _('Money')
    }[item] || item
  end 

end
