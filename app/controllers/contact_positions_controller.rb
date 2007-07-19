class ContactPositionsController < ApplicationController
  
  needs_organization
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @contact_positions = @organization.contact_positions
  end

  def new
    @contact_position = ContactPosition.new
  end

  def create
    @contact_position = ContactPosition.new(params[:contact_position])
    @contact_position.organization = @organization
    if @contact_position.save
      flash[:notice] = _('Contact Position was successfully created.')
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @contact_position = @organization.contact_positions.find(params[:id])
  end

  def update
    @contact_position = @organization.contact_positions.find(params[:id])
    if @contact_position.update_attributes(params[:contact_position])
      flash[:notice] = 'ContactPosition was successfully updated.'
      redirect_to :action => 'list' 
    else
      render :action => 'edit', :id => @contact_position
    end
  end

  def destroy
    @organization.contact_positions.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
