class MassMailsController < ApplicationController

  needs_organization

  before_filter :create_tabs

  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @mass_mails = @organization.mass_mails
  end

  def show
    @mass_mail = @organization.mass_mails.find(params[:id])
  end

  def new
    @mass_mail = MassMail.new
    @mass_mail.organization = @organization
  end

  def create
    @mass_mail = MassMail.new(params[:mass_mail])
    @mass_mail.organization = @organization
    if @mass_mail.save
      flash[:notice] = 'MassMail was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @mass_mail = @organization.mass_mails.find(params[:id])
    @attachment = Attachment.new
  end

  def update
    @mass_mail = MassMail.find(params[:id])
    @attachment = Attachment.new(params[:attachment])
    @attachment.mass_mail_id = params[:id]
    if @attachment.save
      @mass_mail.attachments.push(@attachment)
    end
    if @mass_mail.update_attributes(params[:mass_mail])
      flash[:notice] = 'MassMail was successfully updated.'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @organization.mass_mails.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def filter_categories
    @mass_mail = @organization.mass_mails.find(params[:id])
  end

  def filter_customers
    @mass_mail_id = params[:id]
    @customers = []
    list_categories = params[:categories]
    list_products = params[:products]
    if list_categories and not list_products
      list_categories = list_categories.keys
      @customers.concat(@organization.customers_by_categories(list_categories))
      @customers = @customers.uniq
    elsif list_products and not list_categories
      list_products = list_products.keys
      @customers.concat(@organization.customers_by_products(list_products))
      @customers = @customers.uniq
    elsif list_products and list_categories
      customers_1 = []
      customers_2 = []
      list_categories = list_categories.keys
      list_products = list_products.keys
      customers_1.concat(@organization.customers_by_categories(list_categories))
      customers_2.concat(@organization.customers_by_products(list_products))
      @customers = customers_1 & customers_2
    end  
  end

  def send_emails
    @mass_mail = @organization.mass_mails.find(params[:id])
    @emails = []
    lista = params[:customers]
    if lista
      lista.keys.each { |k|
        @emails.push(@organization.customers.find(k).email)
      }
      DirectMail::deliver_mail_to(@emails, @mass_mail)
      render :partial => "message", :layout => true
    end
  end

  def create_tabs
    add_tab do
      named 'Mass mail'
      links_to :controller => 'mass_mails', :action => 'list'
      in_set 'first'
      highlights_on :controller => 'mass_mails'
    end
  end

  def attachments
    @mass_mail = @organization.mass_mails.find(params[:id])
    @attachment = Attachment.new
  end

  def add_attachment
    @mass_mail = @organization.mass_mails.find(params[:id])
    @attachment = Attachment.new
    @attachment.mass_mail_id = params[:id]
    if @attachment.save
      @mass_mail.attachments.push(@attachment)
      flash[:notice] = _('Attachment was successfully added.')
      redirect_to :action => 'attachments', :id => @mass_mail
    else
      render :action => 'attachments', :id => @product
    end
  end

  def remove_attachment
    Attachment.find(params[:attchment_id]).destroy
    redirect_to :action => 'attchments', :id => params[:mass_mail_id]  #verificar depois para permanecer na tela
  end


end
