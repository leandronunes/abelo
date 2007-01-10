class StockController < ApplicationController

  needs_organization

  def index
    @products = @organization.products
  end

  def history
    @product = @organization.products.find(params[:id])
  end

end
