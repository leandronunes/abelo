class ProductStoreController < ApplicationController

  needs_environment

  acts_as_design_block

  CONTROL_ACTION_OPTIONS = {
    'edit' => _('Edit')
  } 

  def index
    @categories = @organization.top_level_product_categories
    design_render
  end


  def category
    @category = @organization.product_categories.find(params[:category_id])
    if @category.leaf?
      @products = @category.products
      design_render :controller => 'product_store', :action => 'products'
    else
      @categories = @category.children
      design_render :controller => 'product_store', :action => 'index'
    end
  end

  def product
    @product = @organization.products.find(params[:product_id])
    @category = @product.category
    design_render :controller => 'product_store', :action => 'product'
  end
  
  def edit
    design_render_on_edit
  end
  
  def save
    @design_block.update_attributes(params[:design_block])
    design_render_on_edit :nothing => true
  end


end
