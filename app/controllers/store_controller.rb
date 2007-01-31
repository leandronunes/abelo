class StoreController < ApplicationController
  
  needs_organization
  layout 'store'
  skip_before_filter :login_required
  skip_before_filter :check_access_control

  def index
    @categories = @organization.top_level_product_categories
    render :action => 'categories'
  end

  def category
    @category = ProductCategory.find(params[:id])
    if @category.leaf?
      @products = @category.products
      render :action => 'products'
    else
      @categories = @category.children
      render :action => 'categories'
    end
  end

  def product
    @product = Product.find(params[:id])
    @category = @product.category
  end

end
