class StockOutController < StockBaseController

  def list
    list_core('virtual_down')
  end
  
  def history
    history_core('stock_down')
  end

  def new
    new_core('stock_down')

  end

  def create
    create_core('stock_down')
  end

end
