class BankAccount < ActiveRecord::Base
  belongs_to :bank
  belongs_to :owner, :polymorphic => true
  has_many :ledgers, :foreign_key => :bank_account_id

  validates_presence_of :bank_id, :message => _('Bank Accounts must be associated to an Bank')
  validates_presence_of :owner

  acts_as_ferret

  def self.configuration_class
    BankAccountDisplay
  end

  def name 
    _("AG: #{self.agency} / CC: #{self.account}")
  end

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    self.find_by_contents(q, options)
  end


end
