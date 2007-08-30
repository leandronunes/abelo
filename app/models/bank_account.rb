class BankAccount < ActiveRecord::Base
  belongs_to :bank
  belongs_to :owner, :polymorphic => true
  has_many :ledgers, :foreign_key => :bank_account_id

  validates_presence_of :bank_id, :message => _('Bank Accounts must be associated to an Bank')
  validates_presence_of :owner

  def self.configuration_class
    BankAccountDisplay
  end

  def name 
    _("AG: + #{self.agency} + / CC: + #{self.account}")
  end
end
