class StockInController < StockBaseController

  def list
    list_core('virtual_in')
  end

  def new
    @suppliers = @organization.suppliers
    @invoice = Invoice.new(:issue_date => Date.today)
    @products = @organization.products
    @stock = StockIn.new
  end

  def create
    create_core('stock_in')
  end

  def history
    history_core('stock_in')
  end

end
