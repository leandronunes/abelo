class OrganizationConfigurationController < ApplicationController

  needs_organization

  CASH_FLOW_MODELS = %w[
    historical
    specification
  ]

  MODELS = CASH_FLOW_MODELS

  def index
    @objects = Array.new
    @objects = ['cash_flow']
    @title = _('Listing objects of configuration')
  end

  def cash_flow
    @models = CASH_FLOW_MODELS
    @title = _('Cash flow related configurations')
    render :action => 'models'
  end

  def list

    @model_name  = params[:model_name]

    if (MODELS.include?(@model_name))
      @the_model = eval(@model_name.camelize)
      @objects = @the_model.find_all()
    end

    render :partial => 'list', :layout => true

  end

  def new
    @model_name  = params[:model_name]
    if (MODELS.include?(@model_name))
      @the_model = eval(@model_name.camelize)
      @object = @the_model.new()
      instance_variable_set("@#{@model_name}", @object)
    end

    if params[:model_name] == 'historical'
      render :partial => 'new_historical', :layout => true
    else
      render :partial => 'new', :layout => true
    end

  end

  def edit

    @model_name  = params[:model_name]

    if (MODELS.include?(@model_name))
      @the_model = eval(@model_name.camelize)
      @object = @the_model.find(params[:id])
      instance_variable_set("@#{@model_name}", @object)
    end

    if params[:model_name] == 'historical'
      render :partial => 'edit_historical', :layout => true
    else
      render :partial => 'edit', :layout => true
    end

  end

  def update

    @model_name  = params[:model_name]

    if (MODELS.include?(@model_name))
      @the_model = eval(@model_name.camelize)
      @object = @the_model.find(params[:id])

      if @object.update_attributes(params[@model_name])
        flash[:notice] = _('Item was successfully updated.')
        redirect_to :action => 'show', :model_name => @model_name, :id => @object
      else
        if params[:model_name] == 'historical'
          render :partial => 'edit_historical', :layout => true
        else
          render :partial => 'edit', :layout => true
        end
      end 

    end

  end

  def create

    @model_name  = params[:model_name]
    if (MODELS.include?(@model_name))
      @the_model = eval(@model_name.camelize)
      @object = @the_model.new(params[@model_name])
      @object.organization = @organization
      if @object.save
        flash[:notice] = _('Item was successfully created.')
        redirect_to :action => 'list', :model_name => @model_name
      else
        if params[:model_name] == 'historical'
          render :partial => 'new_historical', :layout => true
        else
	  render :partial => 'new', :layout => 'true'
	end
      end

    end

  end

  def show

    @model_name  = params[:model_name]

    if (MODELS.include?(@model_name))
      @the_model = eval(@model_name.camelize)
      @object = @the_model.find(params[:id])
      instance_variable_set("@#{@model_name}", @object)
    end

    render :partial => 'show', :layout => true

  end

  def destroy

    @model_name  = params[:model_name]

    if (MODELS.include?(@model_name))
      @the_model = eval(@model_name.camelize)
      object = @the_model.find(params[:id]).destroy
    end

    redirect_to :action => 'list', :model_name => @model_name, :layout => true

  end
end
