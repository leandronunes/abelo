class StoreArticleController < ApplicationController

  design :holder => 'environment'

  before_filter :detect_stuff_by_domain

  skip_before_filter :login_required
  skip_before_filter :check_access_control
 
  before_filter :load_page

  layout :set_layout

  def set_layout
    File.join('organizations', @organization.identifier)
  end

  def load_page
    @page = @environment.articles.find(params[:page])
  end

  def index
    @categories = @organization.top_level_product_categories
    if request.xml_http_request?
      render :update do |page|
        page.replace_html 'store_content', :partial => 'index'
      end
    else
      render :action => 'index'
    end
  end


  def category
    @category = @organization.product_categories.find(params[:category_id])
    if @category.leaf?
      @products = @category.products
   
      render :update do |page|
        page.replace_html 'store_content', :partial => 'products'
      end
    else
      @categories = @category.children
      render :update do |page|
        page.replace_html 'store_content', :partial => 'index'
      end
    end
  end

  def product
    @product = @organization.products.find(params[:product_id])
    @category = @product.category
    render :update do |page|
      page.replace_html 'store_content', :partial => 'product'
    end
  end
  
end
