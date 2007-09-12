module ProductsHelper

  def display_edit_info_options(object, params = {}, html_options = {})
    content_tag(:div,
      [
        button('back', _('Back'), :back, {:action => 'list'}.merge(params)),
        button('save', _('Save'), :save),
        button('reset', _('Reset'), :reset, {}, {:type => 'reset'} ),
        button('add', _('Entry to stock'), :add, {:action => 'new_stock_entry', :id => @product.id})
      ].join("\n"),
      html_options
    )
  end
  
  alias :display_new_info_options :display_edit_info_options 
  
end
