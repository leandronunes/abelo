module CashFlowsHelper

  def generate_extract(extract, period, historicals, cash_flows)
    cash_flows = cash_flows.sort {|x, y| x.date <=> y.date }
    if historicals.empty?
      content_tag('p', _('None')) 
    else
      if extract == 'simplified'
        content_tag('table',
          {  
            content_tag('tr', [ content_tag('th', _('Historical') ), content_tag('th', _('Value') ), content_tag('th', 'Foreseen') ]),
            historicals.map do |h|
              total_value = CashFlow.historical_total_value(cash_flows, false, h)
	      total_value_foreseen = CashFlow.historical_total_value(cash_flows, true, h)
	      if total_value > 0
                [content_tag('tr', [ content_tag('td', h.name), content_tag('td', total_value ), content_tag('td', ' ') ] ),
		if total_value_foreseen > 0
                  content_tag('tr', [ content_tag('td', h.name), content_tag('td', total_value_foreseen ), content_tag('td', 'x', "align" => "center") ] )
		end ]
	      elsif total_value_foreseen > 0
                  content_tag('tr', [ content_tag('td', h.name), content_tag('td', total_value_foreseen ), content_tag('td', 'x', "align" => "center") ] )
	      end
            end
          }
        )
      else
        if period == "day"
          content_tag('table',
            [  
              content_tag('tr', [ content_tag('th', _('Codigo') ), content_tag('th', _('Value') ), content_tag('th', _('Foreseen')) ]),
              historicals.map do |h|
                [content_tag('tr', content_tag('th', h.name, "colspan" => "3")),
                cash_flows.map do |c|
  	          if c.historical_id == h.id
		      foreseen = ' '
                      foreseen = 'x' if c.foreseen 
                      content_tag('tr',
                        [ content_tag('td', c.id, "align" => "center"), content_tag('td', c.value ), content_tag('td', foreseen, "align" => "center") ]
  		    )
  		  end
  	        end]
              end
            ]
          )
	elsif period == "month" 
          content_tag('table',
            [  
              content_tag('tr', [ content_tag('th', _('Date') ), content_tag('th', _('Value') ), content_tag('th', _('Foreseen'))]),
              historicals.map do |h|
                [content_tag('tr', content_tag('th', h.name, "colspan" => "3")),
                cash_flows.map do |c|
  	          if c.historical_id == h.id	  
		      foreseen = ' '
                      foreseen = 'x' if c.foreseen 
                      content_tag('tr',
                        [ content_tag('td', c.date), content_tag('td', c.value ), content_tag('td', foreseen, "align" => "center") ]
  		    )
  		  end
  	        end]
              end
            ]
          )
	elsif period == "year"  
          content_tag('table',
            [  
              content_tag('tr', [ content_tag('th', _('Mês') ), content_tag('th', _('Value') ), content_tag('th', _('Foreseen'))]),
              historicals.map do |h|
		month = -1
                [content_tag('tr', content_tag('th', h.name, "colspan" => "3")),
                cash_flows.map do |c|
		  if c.date.month != month
  		    month = c.date.month
		    month_value = CashFlow.month_total_value(month, cash_flows, false, h)
		    month_value_foreseen = CashFlow.month_total_value(month, cash_flows, true, h)
		    if month_value > 0
                      [content_tag('tr', [ content_tag('td', month, "align" => "center"), content_tag('td', month_value ), content_tag('td', ' ') ] ),			
                      if month_value_foreseen > 0
                        content_tag('tr', [ content_tag('td', month, "align" => "center"), content_tag('td', month_value_foreseen ), content_tag('td', 'x', "align" => "center") ] ) 
    		      end ]
		    elsif month_value_foreseen > 0
                      content_tag('tr', [ content_tag('td', month, "align" => "center"), content_tag('td', month_value_foreseen ), content_tag('td', 'x', "align" => "center") ] ) 
		    end
  	          end
		end]
              end
            ]
          )
	end

      end
    end
  end

end
