class StockInController < StockBaseController

  def list
    list_core('virtual_devolution')
  end

  def new
    new_core('stock_devolution')
  end

  def create
    create_core('stock_devolution')
  end

  def history
    history_core('stock_devolution')
  end

end
