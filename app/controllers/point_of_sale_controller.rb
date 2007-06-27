class PointOfSaleController < ApplicationController

  needs_organization
  uses_popup_plugin
  layout 'point_of_sale'

  verify :method => :post, :only => [ :new, :add_item, :set_customer, :cancel ], :redirect_to => { :action => :index }

  def index
    @pending_sales = @organization.pending_sales(current_user)
  end

  def new
    sale = @organization.nil_open_sale(current_user)

    if sale.nil?
      sale = Sale.new
    end
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
    begin
      sale = @organization.sales.find(params[:id])
      item = SaleItem.new
      item.product = @organization.products.find(params[:product_id])
      item.ammount = params[:ammount]
      sale.items << item
      render :partial => 'item', :locals => { :item => item }
    rescue StandardError
      render :text => $!.to_s, :status => 500, :layout => false
    end
  end

  def set_customer
    sale = @organization.sales.find(params[:id])
    sale.customer = @organization.customers.find(params[:customer_id])
    sale.save
    render :nothing => true
  end

  def cancel
    @sale = @organization.sales.find(params[:id])
    if @sale.cancel!
      redirect_to :action => 'index'
    else
      render :action => 'main'
    end
  end

  def close
    @sale = @organization.sales.find(params[:id])
    if @sale.close!
      
      #Create a new exit in cash flow
      cf = CashFlow.new
      cf.add_sale(@sale.id)
      #end of creation

      redirect_to :action => 'index'
    else
      render :action => 'main'
    end
  end

  def search_customer
    @people = @organization.customers
    @sale_id = params[:sale_id]
    render :template => 'point_of_sale/search_customer'
  end

  def show_customers
    existing_people_keys = params[:existing_people] ? params[:existing_people].keys.map { |k| k.to_i } : []
    options = params[:options]
    @people = Customer.search(params[:search], existing_people_keys, options)
    @type_select = params[:type_select]
    render :action => 'show_customers', :layout => false
  end

end
