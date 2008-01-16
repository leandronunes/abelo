class StockOutController < StockBaseController

  def list
    list_core('virtual_out')
  end
  
  def history
    history_core('stock_out')
  end

end
