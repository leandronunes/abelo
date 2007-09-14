class Payment < ActiveRecord::Base 

  after_create do |payment|
    return true unless  payment.ledger.nil?
    transaction do 
      ledger = CreditLedger.new
      payment.owner.ledgers << ledger
      ledger.date = payment.date
      ledger.bank_account = payment.owner.organization.default_bank_account
      ledger.value = payment.value
      ledger.category_id = 1
      payment.ledger =ledger
      ledger.save!
    end
  end

  attr_accessor :owner

  has_one :ledger
  validates_presence_of :date

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
