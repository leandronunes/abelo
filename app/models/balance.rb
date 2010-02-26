require 'extended_date'
class Balance < ActiveRecord::Base

  belongs_to :bank_account
  validates_presence_of :bank_account_id
  validates_presence_of :value
  validates_presence_of :date

  def validate
    start_date = Date.beginning_of_month(self.date)
    end_date = Date.end_of_month(self.date)
    self.errors.add(:date, t(:you_cant_have_two_balances_created_for_a_month)) if self.new_record? and Balance.exists?(:date => (start_date..end_date), :bank_account_id => self.bank_account)
  end

  def display_class
    BalanceDisplay
  end

  def refresh
    start_date = Date.beginning_of_month(self.date)
    end_date = Date.end_of_month(self.date)
    self.value  = Ledger.sum(:effective_value, :conditions => {:effective_date => (start_date..end_date), :bank_account_id => self.bank_account})
    self.save
  end

  def income?
    self.value >= 0
  end

  def expense?
    self.value < 0
  end

  # Create a balance object. If the date is passed as parameter the balance 
  # will be created with the end of the month of the passed date. If the date
  # corresponding of the end of month is the future the balance will be created
  # with the current date.
  def self.create_balance(options)
    date = options[:date] || Date.today
    end_of_month = Date.end_of_month(date)
    date = (end_of_month > Date.today) ? Date.today : end_of_month
    Balance.create(options.merge(:date => date))
  end

  # Return the last balance found for object and account before the date passed as argument
  def self.last_balance_before_date(object, account, date)
    object.balances.find(:all, :conditions => {:date => (Date.commercial..Date.end_of_month(date<<1)), :bank_account_id  => account}, :order => :date).last
  end

end

