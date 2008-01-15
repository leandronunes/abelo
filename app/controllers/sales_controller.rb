class SalesController < ApplicationController

  needs_organization

  before_filter :create_sales_tabs

  def index
    redirect_to :action => 'list'
  end

  def list
    @sales = @organization.sales
  end

end
