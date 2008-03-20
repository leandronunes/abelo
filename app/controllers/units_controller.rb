class UnitsController < ApplicationController

  needs_organization

  uses_configurations_tabs

  def autocomplete_unit_name
    escaped_string = Regexp.escape(params[:unit][:name])
    re = Regexp.new(escaped_string, "i")
    @units = @organization.units.select { |pr| pr.name.match re}
    render :layout=>false
  end

  # Show all units
  def index
    redirect_to :action => 'list'
  end

  def list
    @query = params[:query]
    @query ||= params[:unit][:name] if params[:unit]

    if @query.nil?
      @units = @organization.units
      @unit_pages, @units = paginate_by_collection @units
    else
      @units = @organization.units.full_text_search(@query)
      @unit_pages, @units = paginate_by_collection @units
    end
  end

  def show
    @unit = @organization.units.find(params[:id])
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(params[:unit])
    @unit.organization = @organization
    if @unit.save
      flash[:notice] = _('The unit was successfully created.')
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @unit = @organization.units.find(params[:id])
  end

  def update
    @unit = @organization.units.find(params[:id])

    if @unit.update_attributes(params[:unit])
      flash[:notice] = _('The unit was successfully updated.')
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    @organization.units.find(params[:id]).destroy
    redirect_to :action => 'list'
  end


end
