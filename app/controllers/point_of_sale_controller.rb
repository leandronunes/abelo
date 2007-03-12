class PointOfSaleController < ApplicationController

  needs_organization
  layout 'point_of_sale'

  verify :method => :post, :only => [ :new, :add_item, :set_customer, :cancel ], :redirect_to => { :action => :index }

  def index
    @pending_sales = @organization.pending_sales(current_user)
  end

  def new
    sale = Sale.new
    sale.date = Date.today
    sale.organization = @organization
    sale.user = current_user
    sale.save
    redirect_to :action => 'main', :id => sale.id
  end

  def main
    @sale = @organization.sales.find(params[:id])
  end

  def add_item
    sale = @organization.sales.find(params[:id])
    item = SaleItem.new(params[:item])
    sale.items << item
    render :nothing => true
  end

  def set_customer
    sale = @organization.sales.find(params[:id])
    sale.customer = @organization.customers.find(params[:customer_id])
    sale.save
    render :nothing => true
  end

  def cancel
    sale = @organization.sales.find(params[:id])
    sale.cancel
    redirect_to :action => 'index'
  end

end
