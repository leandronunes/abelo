class Balance < ActiveRecord::Base

  belongs_to :bank_account
  validates_presence_of :bank_account_id
  validates_presence_of :value
  validates_presence_of :date

  def validate
    start_date = Date.beginning_of_month(self.date)
    end_date = Date.end_of_month(self.date)
    self.errors.add(:date, _("You can't have two balances created for a month")) if self.new_record? and Balance.exists?(:date => (start_date..end_date), :bank_account_id => self.bank_account)
  end

  def display_class
    BalanceDisplay
  end

  def refresh
    start_date = Date.beginning_of_month(self.date)
    end_date = Date.end_of_month(self.date)
    self.value  = Ledger.sum(:effective_value, :conditions => {:effective_date => (start_date..end_date), :bank_account_id => self.bank_account})
    self.save!
  end

end

