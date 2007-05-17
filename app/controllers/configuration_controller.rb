class ConfigurationController < ApplicationController

  needs_organization

  CASH_FLOWS_MODELS = %w[
    historical
    specification
  ]

  MODELS = CASH_FLOWS_MODELS

  def index
    @objects = Array.new
    @objects = ['cash_flow']
  end

  def cash_flow
    @models = CASH_FLOWS_MODELS
    @title = _('Cash flow related configurations')
    render :partial => 'models', :layout => true
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
        render :partial => 'edit', :layout => false
      end 

    end

  end

  def create

    @model_name  = params[:model_name]

    if (MODELS.include?(@model_name))
      @the_model = eval(@model_name.camelize)
      @object = @the_model.new(params[@model_name])

      if @object.save
        flash[:notice] = _('Item was successfully created.')
        redirect_to :action => 'list', :model_name => @model_name
      else
        render :partial => 'new', :layout => false
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
