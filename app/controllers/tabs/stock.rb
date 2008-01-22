def create_stock_tabs
  t = add_tab do
    links_to :controller => 'stock'
    in_set 'first'
    highlights_on :controller => 'stock'
  end
  t.named _('Stock control')

  t = add_tab do
    links_to :controller => 'stock_in'
    in_set 'first'
    highlights_on :controller => 'stock_in'
  end
  t.named _('Buy Control')

  t = add_tab do
    links_to :controller => 'stock_out'
    in_set 'first'
    highlights_on :controller => 'stock_out'
  end
  t.named _('Sell Control')

  t = add_tab do
    links_to :controller => 'stock_devolution'
    in_set 'first'
    highlights_on :controller => 'stock_devolution'
  end
  t.named _('Devolution Control')

  t = add_tab do
    links_to :controller => 'stock_down'
    in_set 'first'
    highlights_on :controller => 'stock_down'
  end
  t.named _('Stock Out Control')

end
