class ContentViewerController < ApplicationController


  def index
    redirect_to :action => 'view_page'
  end

  def view_page
    path = params[:page].clone
    path.unshift(params[:organization_nickname])
    @path = path.join('/')
    @page = Article.find_by_path(@path)
    if @page.nil?
      render :action => 'not_found', :status => 404
    end
  end

end
