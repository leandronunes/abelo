class Historical < ActiveRecord::Base
  has_many :cash_flows

  def cash_flows_for_day(date)
    return self.cash_flows.find(:all, :conditions => "date = '#{date}'" )
  end

  def cash_flows_for_month(month)
    return self.cash_flows.find(:all, :conditions => "date.month = '#{month}'" )
  end

  def cash_flows_for_year(year)
    return self.cash_flows.find(:all, :conditions => "date.year = '#{year}'" )
  end
end
