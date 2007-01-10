class StockController < ApplicationController

  needs_organization

  def index
    @products = @organization.products
  end

  def history
    @product = @organization.products.find(params[:id])
    @entries = @product.stock_entries

    @total_ammount = @product.ammount_in_stock
    @total_cost = @product.total_cost

  end

end
