class SalesController < ApplicationController

  needs_organization

  uses_sales_tabs

  def autocomplete_customer_name
    escaped_string = Regexp.escape(params[:customer][:name])
    re = Regexp.new(escaped_string, "i")
    @customers = @organization.customers.select { |c| c.name.match re}
    render :layout=>false
  end

  def index
    redirect_to :action => 'list'
  end

  def list
    @sales = @organization.sales
  end

end
