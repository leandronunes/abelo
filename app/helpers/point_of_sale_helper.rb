module PointOfSaleHelper
  
  #FIXME see if it's usefull
  def search_customer(destination_element, existing_customers = [] , type_select = 'check_box')
    [
      form_remote_tag(:url => { :action => 'show_customers', :type_select => type_select }, :update => destination_element),
      existing_customers.map { |p| hidden_field_tag("existing_customers[#{p.id}]", 1) }.join("\n"),
      text_field_tag('search'), "<ul class='search_list'><li>"+_('CPF'),
      check_box_tag('options[cpf]'), "</li><li>" + _('Rg'),
      check_box_tag('options[rg]'), "</li><li>" + _('Name'),
      check_box_tag('options[name]'), "</p><p>",
      submit_tag(_('Search'), { :class => 'button button_search' }),"</p><p>",
     end_form_tag
    ].join("\n")
  end

end
