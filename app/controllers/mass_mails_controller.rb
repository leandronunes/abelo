class MassMailsController < ApplicationController

  needs_organization

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
  end

  def update
    @mass_mail = MassMail.find(params[:id])
    if @mass_mail.update_attributes(params[:mass_mail])
      flash[:notice] = 'MassMail was successfully updated.'
      redirect_to :action => 'show', :id => @mass_mail
    else
      render :action => 'edit'
    end
  end

  def destroy
    @organization.mass_mails.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
