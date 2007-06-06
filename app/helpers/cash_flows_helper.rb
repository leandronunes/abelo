module CashFlowsHelper

  def generate_extract(extract, period, historicals, cash_flows)
    cash_flows = cash_flows.sort {|x, y| x.date <=> y.date }
    if historicals.empty?
      content_tag('p', _('None')) 
    else
      if extract == 'simplified'
        content_tag('table',
          {  
            content_tag('tr', { content_tag('th', _('Historical') ), content_tag('th', _('Value') ) }),
            historicals.map do |h|
              content_tag('tr',
                { content_tag('td', h.name), content_tag('td', CashFlow.total_value(cash_flows) ) }
              )
            end
          }
        )
      else
        if period == "day"
          content_tag('table',
            {  
              content_tag('tr', { content_tag('th', _('Codigo') ), content_tag('th', _('Value') ) }),
              historicals.map do |h|
                {content_tag('tr', content_tag('th', h.name, "colspan" => "2")),
                cash_flows.map do |c|
  	          if c.historical_id == h.id	  
                      content_tag('tr',
                        { content_tag('td', c.id, "align" => "center"), content_tag('td', c.value ) }
  		    )
  		  end
  	        end}
              end
            }
          )
	elsif period == "month" 
          content_tag('table',
            {  
              content_tag('tr', { content_tag('th', _('Date') ), content_tag('th', _('Value') )}),
              historicals.map do |h|
                {content_tag('tr', content_tag('th', h.name, "colspan" => "2")),
                cash_flows.map do |c|
  	          if c.historical_id == h.id	  
                      content_tag('tr',
                        { content_tag('td', c.date), content_tag('td', c.value ) }
  		    )
  		  end
  	        end}
              end
            }
          )
	elsif period == "year"  
          content_tag('table',
            {  
              content_tag('tr', { content_tag('th', _('Mês') ), content_tag('th', _('Value') )}),
              historicals.map do |h|
                {content_tag('tr', content_tag('th', h.name, "colspan" => "2")),
                cash_flows.map do |c|
		  month = c.date.month
		  month_value = 0.0
		  i = 0
		  while i <= cash_flows.length-1
		    if (month == cash_flows[i].date.month)
		      month_value += cash_flows[i].value
		      cash_flows.delete_at(i)
		      i = i - 1
		    end
		    i = i + 1
		  end
  	          if c.historical_id == h.id	  
                      content_tag('tr',
                        { content_tag('td', month), content_tag('td', month_value ) }
  		    )
  		  end
  	        end}
              end
            }
          )
	end

      end
    end
  end

end
