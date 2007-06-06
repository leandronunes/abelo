module CashFlowsHelper

  def generate_extract(extract, period, historicals, cash_flows)
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
  	          if c.historical_id == h.id	  
                      content_tag('tr',
                        { content_tag('td', c.date.month), content_tag('td', c.value ) }
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
