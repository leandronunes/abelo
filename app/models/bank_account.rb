class BankAccount < ActiveRecord::Base
  belongs_to :bank
  belongs_to :organization
  has_many :ledgers, :foreign_key => :bank_account_id
  has_many :balances

  validates_presence_of :bank_id, :message => I18n.t(:bank_id_is_required)
  # TODO fix it
  #t(:bank_accounts_must_be_associated_to_an_bank)
  validates_presence_of :organization_id

  after_save do |account|
    if account.is_default?
      default_account = account.organization.default_bank_account
      if default_account != account
        default_account.is_default = false
        default_account.save
      end
    end
  end

#  acts_as_ferret :remote => true

  def name 
    I18n.t(:bank_account_name, {:agency => self.agency, :account => self.account})
  end

  def self.full_text_search(q, options = {})
    default_options = {:limit => :all, :offset => 0}
    options = default_options.merge options
    self.find_by_contents(q, options)
  end

end
