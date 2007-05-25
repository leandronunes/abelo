module CashFlowsHelper

  def generate_extract(extract, historicals)
    if historicals.empty?
      content_tag('p', _('None')) 
    else
      content_tag('table',
        {  
          content_tag('tr', { content_tag('th', _('Historical') ), content_tag('th', _('Value') ) }),
          historicals.map do |h|
            content_tag('tr',
              { content_tag('td', h.name), content_tag('td', @organization.historical_total_value(h.id) ) }
            )
          end
        }
      )
    end
  end

end
