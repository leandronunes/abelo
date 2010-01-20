
def create_sales_tabs
  t = add_tab do
    links_to :controller => 'sales'
    in_set 'first'
    highlights_on :controller => 'sales'
  end
  t.named t(:sales)

  t = add_tab do
    links_to :controller => 'sintegra'
    in_set 'first'
    highlights_on :controller => 'sintegra'
  end
  t.named t(:sintegra)

end
