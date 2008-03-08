def create_stock_tabs
  t = add_tab do
    links_to :controller => 'stock'
    in_set 'first'
    highlights_on :controller => 'stock'
  end
  t.named _('Stock control')

  t = add_tab do
    links_to :controller => 'stock_buys'
    in_set 'first'
    highlights_on :controller => 'stock_buys'
  end
  t.named _('Buy')

  t = add_tab do
    links_to :controller => 'stock_ins'
    in_set 'first'
    highlights_on :controller => 'stock_ins'
  end
  t.named _('Stock Replenishment')

  t = add_tab do
    links_to :controller => 'stock_devolutions'
    in_set 'first'
    highlights_on :controller => 'stock_devolutions'
  end
  t.named _('Devolution')

  t = add_tab do
    links_to :controller => 'stock_downs'
    in_set 'first'
    highlights_on :controller => 'stock_downs'
  end
  t.named _('Stock Down')

end

