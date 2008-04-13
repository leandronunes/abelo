class ArticlePathController < ApplicationController

  needs_environment

  acts_as_design_block

  CONTROL_ACTION_OPTIONS = {
    'edit' => _('Edit')
  }


  def index

    
    path = params[:page].to_a.join('/')

    if path.blank?
      @page = @environment.home_page
    else
      @page = @environment.articles.find_by_path(path)
    end
    design_render :controller => 'article_path', :action => 'index'
  end

  def edit
    design_render_on_edit
  end

  def save
    @design_block.update_attributes(params[:design_block])
    design_render_on_edit :nothing => true
  end

end
