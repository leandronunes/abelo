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
  CHANGE = 'change'

  PAYMENT_METHODS = {MONEY => Money, CHECK => Check, CREDIT_CARD => CreditCard, DEBIT_CARD => DebitCard}
  PAYMENT_TYPES = PAYMENT_METHODS.merge({ADD_CASH => AddCash, REMOVE_CASH => RemoveCash, CHANGE => Change})

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
      'I' => I18n.t(:income),
      'E' => I18n.t(:expense)
    }[item] || item
  end


  def self.describe_payment(item)
    {
      'check' => I18n.t(:check),
      'credit_card' => I18n.t(:credit_card),
      'debit_card' => I18n.t(:debit_card),
      'money' => I18n.t(:money),
      'remove_cash' => I18n.t(:remove_cash),
      'add_cash' => I18n.t(:add_cash),
      'change' => I18n.t(:change),
    }[item] || item
  end 

end
