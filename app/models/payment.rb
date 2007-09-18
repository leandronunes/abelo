class Payment < ActiveRecord::Base 

  belongs_to :owner, :polymorphic => true
  has_one :ledger, :dependent => :destroy
  
  validates_presence_of :date
  validates_presence_of :owner

#FIXME thi method has a problem. With this implementation i can have ledger without a payment
#  before_validation do |payment|
#    unless payment.owner.nil?
#      transaction do 
#        ledger = CreditLedger.new
#        payment.owner.ledgers << ledger
#        ledger.date = payment.date
#        ledger.bank_account = payment.owner.organization.default_bank_account
#        ledger.value = payment.value
#        ledger.category_id = 1
#        payment.ledger = ledger
#        payment.ledger = nil unless ledger.save
#      end
#    end
#  end

  def value
    self[:value] || 0
  end

  def validate
    self.errors.add(:value, _("The value should be at least 0.01" )) if self.value <= 0.00

    self.errors.add(:ledger, _('You cannot have a payment without a ledger')) if self.ledger.nil?    

    if (!self.owner.nil?) and ((self.owner.balance - self.value) < 0)
      self.errors.add(:value, _('The value cannot be greater than %s.') % self.owner.balance)
    end
  end

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
