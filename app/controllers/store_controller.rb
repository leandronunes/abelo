class StoreController < ApplicationController
  
  needs_organization
  layout 'store'

  def index
    @categories = @organization.top_level_product_categories
  end

  def category
    @category = ProductCategory.find(params[:id])
    @sub_categories = @category.children
  end

  def product
    @product = Product.find(params[:id])
    @category = @product.category
  end

end
