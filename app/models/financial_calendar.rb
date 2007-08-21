class FinancialCalendar < Design::Block

  #TODO implements a financial calendar like in controller ledgers action get_budgets
  def content
    Department.find(:all).map{|p|p.name}
  end
end
