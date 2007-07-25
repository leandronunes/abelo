class StoreController < ApplicationController
  
  needs_organization
  skip_before_filter :login_required
  skip_before_filter :check_access_control
  before_filter :create_tabs
  
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

  def create_tabs
    add_tab do
      named 'Store'
      links_to :controller => 'store', :action => 'list'
      in_set 'first'
      highlights_on :controller => 'store'
    end
  end

end
