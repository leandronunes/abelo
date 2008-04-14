class TrackerController < ApplicationController

  needs_administrator

  uses_admin_organization_tabs

  def index
    redirect_to :action => 'show', :organization_id => params[:organization_id]
  end

  def show
    @organization = Organization.find(params[:organization_id])
    @tracker = @organization.tracker
  end

  def edit
    @organization = Organization.find(params[:organization_id])
    @tracker = @organization.tracker
  end

  def update
    @organization = Organization.find(params[:organization_id])
    @tracker = @organization.tracker
    if @tracker.update_attributes(params[:tracker]) 
      flash[:notice] = _('Tracker was successfully updated.')
      redirect_to :action => 'show', :organization_id => @organization
    else
      flash[:notice] = _('Tracker was not updated.')
      redirect_to :action => 'edit', :organization_id => @organization
    end
  end

  def draw
    @organization = Organization.find(params[:organization_id])
    tracker = @organization.tracker
    g = Gruff::SideStackedBar.new('700x100')
    g.theme_pastel
    g.hide_legend = true
    g.hide_title = true
    g.minimum_value = 0
    g.maximum_value = tracker.available_points

    g.marker_font_size=18
    g.has_left_labels=true
    g.data(_("Used Points"), tracker.total_points)
    g.labels = {0 => _('Used Points')}

    send_data(g.to_blob,
      :disposition => 'inline',
      :type => 'image/png',
      :filename => "graphic_image.png")
  end

end
