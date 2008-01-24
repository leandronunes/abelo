module StockHelper
  def display_stock_collection(collection = Array.new, params = {}, html_options = {})

    content = Array.new
    collection.each do |c|
      content.push(
        [
          display_stock_collection_options(c, params),
          display_info(c, html_options, true )
        ]
      )
    end

    display_list_info(content, html_options)

  end

  def display_stock_collection_options(item, params ={})
    content_tag(:div,
      [
        button('new_entry', _('New entry'), :new_entry, {:action => 'new', :product_id => item.product_in_list.id}.merge(params)),
        button('history', _('History'), :history, {:action => 'history', :product_id => item.product_in_list.id}.merge(params))
      ].join("\n"),
      :class => 'list_item_button'
    )
  end

#TODO see why this same implementation of rails method didn't works
  def error_messages_for(*params)
     options = params.last.is_a?(Hash) ? params.pop.symbolize_keys : {}
     objects = params.collect {|object_name| instance_variable_get("@#{object_name}") }.compact
     count   = objects.inject(0) {|sum, object| sum + object.errors.count }
     unless count.zero?
       html = {}
       [:id, :class].each do |key|
         if options.include?(key)
           value = options[key]
           html[key] = value unless value.blank?
         else
           html[key] = 'errorExplanation'
         end
       end
       header_message = "#{pluralize(count, 'error')} prohibited this #{(options[:object_name] || params.first).to_s.gsub('_', ' ')} from being saved"
       error_messages = objects.map {|object| object.errors.full_messages.map {|msg| content_tag(:li, msg) } }
       content_tag(:div,
         content_tag(options[:header_tag] || :h2, header_message) <<
           content_tag(:p, 'There were problems with the following fields:') <<
           content_tag(:ul, error_messages),
         html
       )
     else
       ''
     end
   end


end
