module PointOfSaleHelper
  
  def search_customer(destination_element, existing_people = [] , type_select = 'check_box')
    [
      form_remote_tag(:url => { :action => 'people', :type_select => type_select }, :update => destination_element),
      existing_people.map { |p| hidden_field_tag("existing_people[#{p.id}]", 1) }.join("\n"),
      text_field_tag('search'), "<ul class='search_list'><li>"+_('CPF'),
      check_box_tag('options[cpf]'), "</li><li>" + _('Rg'),
      check_box_tag('options[rg]'), "</li><li>" + _('Name'),
      check_box_tag('options[name]'), "</li><li>" + _('Login'),
      check_box_tag('options[login]'), "</p><p>",
      submit_tag(_('Search'), { :class => 'button button_search' }),"</p><p>",
      end_form_tag
    ].join("\n")
  end

end
