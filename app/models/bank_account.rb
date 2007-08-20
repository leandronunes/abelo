class BankAccount < ActiveRecord::Base
  belongs_to :bank
  belongs_to :owner, :polymorphic => true

  validates_presence_of :bank_id
  validates_presence_of :owner

  def self.title_bank
    _('Bank')
  end

  def self.title_agency
    _('Agency')
  end

  def self.title_variation
    _('Variation')
  end

  def self.title_account
    _('Account')
  end

  def self.title_owner
    _('Owner')
  end

end
