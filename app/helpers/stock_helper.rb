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

end
