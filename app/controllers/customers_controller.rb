class CustomersController < ApplicationController

  needs_organization

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @customers = @organization.customers
  end

  def show
    @customer = @organization.customers.find(params[:id])
    @contacts = @customer.contacts
  end

  def new
    @customer = Customer.new
    @customer.organization = @organization
  end

  def create
    @customer = Customer.new(params[:customer])
    @customer.organization = @organization
    if @customer.save
      flash[:notice] = 'Customer was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @customer = @organization.customers.find(params[:id])
  end

  def update
    @customer = @organization.customers.find(params[:id])
    @customer.customer_category_ids = params[:customer_categories].keys if params[:customer_categories]
    if @customer.update_attributes(params[:customer])
      flash[:notice] = 'Customer was successfully updated.'
      redirect_to :action => 'list', :id => @customer
    else
      render :action => 'edit'
    end
  end

  def destroy
    @organization.customers.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def show_contact
    @contact = Contact.find(params[:id])
  end

  def new_contact
    @contact = Contact.new
    @contact.customer_id = params[:id]
  end

  def create_contact
    @contact = Contact.new(params[:contact])
    @contact.customer_id = params[:id] 
    if @contact.save
      flash[:notice] = _('Contact was successfully created.')
      redirect_to :action => 'show', :id => @contact.customer_id
    else
      render :action => 'new_contact'
    end
  end

  def edit_contact
    @contact = Contact.find(params[:id])
  end

  def update_contact
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      flash[:notice] = 'Contact was successfully updated.'
      redirect_to :action => 'show', :id => @contact.customer_id
    else
      render :action => 'edit_contact'
    end
  end

  def destroy_contact
    @customer_id = Contact.find(params[:id]).customer_id
    Contact.find(params[:id]).destroy
    redirect_to :action => 'show', :id => @customer_id
  end

end
