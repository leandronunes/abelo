class SalesController < ApplicationController

  needs_organization

  before_filter :sales_tabs

  def index
    redirect_to :action => 'list'
  end

  def list
    @sales = @organization.sales
  end

  def sales_tabs
    t = add_tab do
      links_to :controller => 'sales'
      in_set 'first'
      highlights_on :controller => 'sales'
    end
    t.named _('Sales')
  end


end
