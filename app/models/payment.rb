class Payment < ActiveRecord::Base 

  PAYMENT_METHODS = %w[
    check
    credit_card
    debit_card
    money
  ]

   def self.describe(item)
     {
      'check' => _('Check'),
      'credit_card' => _('Credit Card'),
      'debit_card' => _('Debit Card'),
      'money' => _('Money')
     }[item] || item
   end
  

end
