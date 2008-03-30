class ContentViewerController < ApplicationController

  design :holder => 'environment'

  before_filter :detect_stuff_by_domain

  skip_before_filter :login_required
  skip_before_filter :check_access_control

  layout :set_layout

  def set_layout
    File.join('organizations', @organization.identifier)
  end

  def view_page
    path = (params[:page]||[]).join('/')

    if path.blank?
      @page = @environment.home_page
      if @page.nil?
        render :action => 'no_home_page'
        return
      end
    else
      @page = @environment.articles.find_by_path(path)
      if @page.nil?
        render_not_found(@path)
        return
      end
    end

    if @page.mime_type != 'text/html'
      headers['Content-Type'] = @page.mime_type
      data = @page.data

      # TODO test the condition
      if data.nil?
        raise "No data for file"
      end
      render :text => data
      return
    end

    begin
      "#{@page.class.name}Controller".constantize
      redirect_to article_page_url(:controller => @page.class.name.underscore, :page => @page)
    rescue
      render :action => 'view_page'
    end
  end

end
