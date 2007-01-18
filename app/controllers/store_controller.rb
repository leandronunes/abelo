class StoreController < ApplicationController
  
  needs_organization 

  def index
    redirect_to :action => 'list'
  end

  def list
    @product_categories =  @organization.product_categories
  end

end
