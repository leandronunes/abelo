module StockHelper

  def show_ammount(n)
    klass = (n > 0) ? ('positive') : ('negative')
    (content_tag 'span', '%2.2f' % n, :class => klass)
  end

  def show_supplier(stock_entry)
     (StockIn === stock_entry) ? stock_entry.supplier.name : ''
  end

  def show_purpose(purpose)
    StockEntry.valid_purposes[purpose]
  end

  def select_purpose(object, method)
    select(object, method, StockEntry.valid_purposes.map { |k,v| [v, k] })
  end

  def display_stock_collection(collection = Array.new, params = {}, html_options = {})
    content = Array.new
    collection.each do |c|
      content.push(
        [
          display_stock_collection_options(c, params),
          display_info(c,html_options, 'in_list' )
        ]
      )
    end
    item_class = []
    item_class.push(html_options[:item_class]) unless item_class.include?(html_options[:item_class])
    collection_class = ['info_list']
    collection_class.push(html_options[:collection_class]) unless collection_class.include?(html_options[:collection_class])
      content_tag(:ul,
        content.map{|c|
          content_tag(:li, c.to_s + tag(:br, :style => 'clear:both;'), :class => item_class.join(' '))
        },
        :class => collection_class.join(' ')
      )
  end

  def display_stock_collection_options(item, params ={})
    content_tag(:div,
      [
        button('new_entry', _('New entry'), :new_entry, {:action => 'new', :id => item.id}.merge(params)),
        button('history', _('History'), :history, {:action => 'history', :id => item.id}.merge(params))
      ].join("\n"),
      :class => 'list_item_button'
    )
  end

  def display_stock_info(object, html_options = {}, type = '')
    type = '_' + type unless type.blank?
    fields = @organization.configuration.send("stock_entry_display#{type}")

    fields.map do |f|
      content_tag(:div,
        display_field_info(object, f),
        html_options
      )
    end.join("\n")
  end

end
