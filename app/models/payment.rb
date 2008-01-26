class Payment  < ActiveRecord::Base

  require 'payment_strategy/payment_strategy'
  include PaymentStrategy


  # Constant used to identifier income ledgers  
  TYPE_OF_INCOME = 'I'

  # Constant used to identifier expense ledgers  
  TYPE_OF_EXPENSE = 'E'

  TYPE_OF = [TYPE_OF_INCOME, TYPE_OF_EXPENSE]

  MONEY = 'money'
  CHECK = 'check'
  CREDIT_CARD = 'credit_card'
  DEBIT_CARD = 'debit_card'
  ADD_CASH = 'add_cash'
  REMOVE_CASH = 'remove_cash'

  PAYMENT_METHODS = {MONEY => Money, CHECK => Check, ADD_CASH => AddCash, REMOVE_CASH => RemoveCash, CREDIT_CARD => CreditCard, DEBIT_CARD => DebitCard}

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
      'money' => _('Money'),
      'remove_cash' => _('Remove Cash'),
      'add_cash' => _('Add Cash'),
    }[item] || item
  end 

end
