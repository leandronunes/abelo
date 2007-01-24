class StoreController < ApplicationController
  
  needs_organization
  layout 'store'

  def index
    redirect_to :action => 'list'
  end

  def list
    if params[:product_category]
      @product_categories = ProductCategory.find(params[:product_category]).children
    else
      @product_categories = @organization.top_level_product_categories
    end
  end

  def list_products 
    @category = ProductCategory.find(params[:product_category]) 
    @products = @category.products
  end

  def show_product
    @product = Product.find(params[:product])
  end

end
