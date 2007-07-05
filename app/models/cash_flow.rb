class CashFlow < ActiveRecord::Base
  belongs_to :historical
  belongs_to :organization
  belongs_to :specification

  def add_stock_entry(entry_id)
    entry = StockIn.find(entry_id)
    self.date = entry.date
    self.value = entry.price

    h = Historical.new
    h.name = "stock entry of #{entry.product.description}"
    h.type_of = TypeTransaction::DEBIT
    h.operational = true
    h.organization = entry.organization
    h.save
    self.historical = h
   
    s = Specification.new
    s.name = entry.supplier.name
    s.organization = entry.organization
    s.save
    self.specification = s

    self.organization = entry.organization
    if entry.payment_status == true
      self.foreseen = true
    end
    self.save
  end

  def add_sale(sale_id)
    sale = Sale.find(sale_id)
    self.date = sale.date
    self.value = sale.total_value

    #connect cash flow to sale
    self.sale_id = sale_id
    #end connect

    h = Historical.new
    h.name = "sale #{sale.id}"
    h.type_of = TypeTransaction::CREDIT
    h.operational = true
    h.organization = sale.organization
    h.save
    self.historical = h 
   
    s = Specification.new
    if sale.customer.nil?
      s.name = 'customer not identified'
    else  
      s.name = sale.customer.name
    end
    s.organization = sale.organization
    s.save
    self.specification = s

    self.organization = sale.organization
    self.save
   
  end

  def CashFlow.total_value(cash_flows, foreseen_value)
    value = 0.0
    if cash_flows
      cash_flows.each { |c|
        if c.foreseen == foreseen_value
          value = value + c.value
	end
      }
    end
    return value
  end

  def CashFlow.historical_total_value(cash_flows, foreseen_value, historical)
    value = 0.0
    if cash_flows
      cash_flows.each { |c|
        if ((c.historical_id == historical.id) and (c.foreseen == foreseen_value))
          value = value + c.value
	end
      }
    end
    return value
  end

  def CashFlow.weekly_total_value(cash_flows, foreseen_value, initial_day, end_day)
    value = 0.0
    if cash_flows
      cash_flows.each { |c|
        if (c.foreseen == foreseen_value and (initial_day <= c.date.day.to_i) and (c.date.day.to_i <= end_day))
          value = value + c.value
	end
      }
    end
    return value
  end

  def CashFlow.weekly_historical_total_value(cash_flows, foreseen_value, historical, initial_day, end_day)
    value = 0.0
    if cash_flows
      cash_flows.each { |c|
        if ((c.historical_id == historical.id) and (c.foreseen == foreseen_value) and (initial_day <= c.date.day) and (c.date.day <= end_day))
            value = value + c.value
        end
      }
    end
    return value
  end


  def CashFlow.month_historical_total_value(month, cash_flows, foreseen_value, historical)
    total = 0.0
    if cash_flows
      cash_flows.each { |c|
        if (c.date.month == month) and (c.foreseen == foreseen_value) and (c.historical_id == historical.id)
          total += c.value
        end
      }
    end
    return total
  end

  def CashFlow.month_total_value(month, cash_flows, foreseen_value)
    total = 0.0
    if cash_flows
      cash_flows.each { |c|
        if (c.date.month == month) and (c.foreseen == foreseen_value)
          total += c.value
        end
      }
    end
    return total
  end

  def CashFlow.weekly_total_entrances(operational_entrances_detailed, not_operational_entrances_detailed, initial_day, end_day, foreseen)
      return CashFlow.weekly_total_value(operational_entrances_detailed, foreseen, initial_day, end_day) + CashFlow.weekly_total_value(not_operational_entrances_detailed, foreseen, initial_day, end_day)
    end

  def CashFlow.weekly_total_exits(operational_exits_detailed, not_operational_exits_detailed, initial_day, end_day, foreseen)
    return CashFlow.weekly_total_value(operational_exits_detailed, foreseen, initial_day, end_day) + CashFlow.weekly_total_value(not_operational_exits_detailed, foreseen, initial_day, end_day)
  end

  def CashFlow.weekly_balance_operational(operational_entrances_detailed, operational_exits_detailed, initial_day, end_day, foreseen)
    return CashFlow.weekly_total_value(operational_entrances_detailed, foreseen, initial_day, end_day) - CashFlow.weekly_total_value(operational_exits_detailed, foreseen, initial_day, end_day)
  end

  def CashFlow.weekly_balance_not_operational(not_operational_entrances_detailed, not_operational_exits_detailed, initial_day, end_day, foreseen)
    return CashFlow.weekly_total_value(not_operational_entrances_detailed, foreseen, initial_day, end_day) - CashFlow.weekly_total_value(not_operational_exits_detailed, foreseen, initial_day, end_day)
  end

  def CashFlow.weekly_balance_total(operational_entrances_detailed, not_operational_entrances_detailed, operational_exits_detailed, not_operational_exits_detailed, initial_day, end_day, foreseen)
    return CashFlow.weekly_total_value(operational_entrances_detailed, foreseen, initial_day, end_day) + CashFlow.weekly_total_value(not_operational_entrances_detailed, foreseen, initial_day, end_day) - CashFlow.weekly_total_value(operational_exits_detailed, foreseen, initial_day, end_day) - CashFlow.weekly_total_value(not_operational_exits_detailed, foreseen, initial_day, end_day)
  end


  def CashFlow.month_total_entrances(month, operational_entrances_detailed, not_operational_entrances_detailed, foreseen)
      return CashFlow.month_total_value(month, operational_entrances_detailed, foreseen) + CashFlow.month_total_value(month, not_operational_entrances_detailed, foreseen)
    end

  def CashFlow.month_total_exits(month, operational_exits_detailed, not_operational_exits_detailed, foreseen)
    return CashFlow.month_total_value(month, operational_exits_detailed, foreseen) + CashFlow.month_total_value(month, not_operational_exits_detailed, foreseen)
  end

  def CashFlow.month_balance_operational(month, operational_entrances_detailed, operational_exits_detailed, foreseen)
    return CashFlow.month_total_value(month, operational_entrances_detailed, foreseen) - CashFlow.month_total_value(month, operational_exits_detailed, foreseen)
  end

  def CashFlow.month_balance_not_operational(month, not_operational_entrances_detailed, not_operational_exits_detailed, foreseen)
    return CashFlow.month_total_value(month, not_operational_entrances_detailed, foreseen) - CashFlow.month_total_value(month, not_operational_exits_detailed, foreseen)
  end

  def CashFlow.month_balance_total(month, operational_entrances_detailed, not_operational_entrances_detailed, operational_exits_detailed, not_operational_exits_detailed, foreseen)
    return CashFlow.month_total_value(month, operational_entrances_detailed, foreseen) + CashFlow.month_total_value(month, not_operational_entrances_detailed, foreseen) - CashFlow.month_total_value(month, operational_exits_detailed, foreseen) - CashFlow.month_total_value(month, not_operational_exits_detailed, foreseen)
  end

end
