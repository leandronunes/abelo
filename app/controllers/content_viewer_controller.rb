class ContentViewerController < ApplicationController

  needs_environment

#FIXME remove this
#  design :holder => 'environment'

  before_filter :detect_stuff_by_domain

#FIXME old implementation for comatose.
#  def view_page
#    path = params[:page].clone
#    path.unshift(params[:organization_nickname])
#    @path = path.join('/')
#    @page = Article.find_by_path(@path)
#    if @page.nil?
#      render :action => 'not_found', :status => 404
#    end
#    render :action => params[:action], :layout => File.join('organizations', params[:organization_nickname])
#  end


  def view_page
    path = params[:page].join('/')

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

      render :text => data, :layout => false
      return
    end
  end

end
