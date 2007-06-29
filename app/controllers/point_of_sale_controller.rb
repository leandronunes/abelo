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
    @total = 0.0
    @sale = @organization.sales.find(params[:id])
    @sale.items.each{|s| @total += (s.ammount * s.unitary_price)}
  end

  def add_item
    begin
      @sale = @organization.sales.find(params[:id])
      @total = 0.0
      item = SaleItem.new
      item.product = @organization.products.find(params[:product_id])
      item.ammount = params[:ammount]
      @sale.items << item
      @sale.items.each{|s| @total += (s.ammount * s.unitary_price)}
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
    @customers = @organization.customers
    @sale_id = params[:sale_id]
    render :template => 'point_of_sale/search_customer'
  end

  def show_customers
    existing_customers_id = params[:existing_customers].any? ? params[:existing_customers].keys : []
    options = params[:options]
    @customers = Customer.search(params[:search], existing_customers_id, options)
    @type_select = params[:type_select]
    render :action => 'show_customers', :layout => false
  end

  def associating_customer
    customer = params[:selected_customer]
    s = Sale.find(params[:sale_id])
    if not customer.nil?
      s.customer = Customer.find(customer)
      s.save
    end
    render :text => s.customer.name
  end

end
