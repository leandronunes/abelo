module PointOfSaleHelper
  
  #FIXME see if it's usefull
  def search_customer(destination_element, existing_customers = [] , type_select = 'check_box')
    [
      form_remote_tag(:url => { :action => 'show_customers', :type_select => type_select }, :update => destination_element),
      existing_customers.map { |p| hidden_field_tag("existing_customers[#{p.id}]", 1) }.join("\n"),
      text_field_tag('search'), "<ul class='search_list'><li>"+t(:cpf),
      check_box_tag('options[cpf]'), "</li><li>" + t(:rg),
      check_box_tag('options[rg]'), "</li><li>" + t(:name),
      check_box_tag('options[name]'), "</p><p>",
      submit_tag(t(:search), { :class => 'button button_search' }),"</p><p>",
     end_form_tag
    ].join("\n")
  end

end
