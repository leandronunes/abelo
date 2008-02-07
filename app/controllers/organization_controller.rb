class OrganizationController < ApplicationController

  needs_organization

  post_only [:update, :update_address]

  before_filter :create_organization_tabs

  def index
    @organization.presentation ||= _('Welcome to Abelo System')
  end

  def update
    if @organization.update_attributes(params[:organization])
      redirect_to :action => 'index'
    else
      render :action => 'edit'
    end
  end

  def address
    @address = @organization.address
  end

  def edit_address
    @address = @organization.address
    #FIXME Remove the forced parameters
    @countries = BSC::Country.find(:all, :conditions => {:name => 'Brazil'})
    @states = BSC::State.find(:all, :conditions => {:country_id => @countries.first})
    @cities = BSC::City.find(:all, :conditions => {:state_id => @states.detect{|s| s.name == 'Bahia'}})
  end

  def update_address
    @address = @organization.address
    if @address.update_attributes(params[:address])
      redirect_to :action => 'address'
    else
      #FIXME Remove the forced parameters
      @countries = BSC::Country.find(:all, :conditions => {:name => 'Brazil'})
      @states = BSC::State.find(:all, :conditions => {:country_id => @countries.first})
      @cities = BSC::City.find(:all, :conditions => {:state_id => @states.detect{|s| s.name == 'Bahia'}})
      render :action => 'edit_address'
    end
  end

  def create_organization_tabs
    t = add_tab do
      links_to :action => 'index'
      in_set 'first'
      highlights_on :action => 'index'
      highlights_on :action => 'edit'
    end
    t.named _('Presentation')

    t = add_tab do
      links_to :action => 'address'
      in_set 'first'
      highlights_on :controller => 'organization'
      highlights_off :action => 'index'
      highlights_off :action => 'edit'
    end
    t.named _('Address')
  end

end
