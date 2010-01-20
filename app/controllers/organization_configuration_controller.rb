class OrganizationConfigurationController < ApplicationController

  needs_organization

  uses_configurations_tabs

  def list
    redirect_to :action => 'show'
  end

  def index
    redirect_to :action => 'show'
  end

  def show
    @configuration = @organization.configuration
    get_sorted_displays
  end

  def edit
    @configuration = @organization.configuration
    get_sorted_displays
  end

  def update
    @configuration = @organization.configuration
    if @configuration.update_attributes(params[:configuration])
      flash[:notice] = t(:the_configurations_was_successfully_updated)
      redirect_to :action => 'show'
    else
      render :action => 'edit', :id => params[:id]
    end
  end

  def set_fields_order
    @configuration = @organization.configuration
    params["#{params[:display_class]}_#{@configuration.id}"].each_with_index do |display_id,position|
      field = @organization.display_configurations.find(display_id)
      switch_field = @organization.display_configurations.find_by_position(position + 1)
      next if field == switch_field
      field.switch(switch_field)
    end
    render :nothing => true
  end

  def get_sorted_displays
    @configuration.class::DISPLAY_CONFIGURATION_CLASSES.each do |item|
      self.instance_variable_set("@#{item.gsub('Display','').underscore}_fields", @configuration.send("sorted_#{item.tableize}"))
    end
  end

end
