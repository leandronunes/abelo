module StockHelper

  def show_ammount(n)
    klass = (n > 0) ? ('positive') : ('negative')
    (content_tag 'span', '%2.2f' % n, :class => klass)
  end

  def show_supplier(stock_entry)
     (StockIn === stock_entry) ? stock_entry.supplier.name : ''
  end

  def show_purpose(purpose)
    {
      'sell' => _('Sell'),
      'production' => _('Production')
    }[purpose]
  end

end
