module TypeOfLedger

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
  def income?
    self.type_of == 'I'
  end

  # Check if the current ledger is a expense
  def expense?
    type_of == 'E'
  end 

end
