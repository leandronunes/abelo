class MenuWebsiteController < ApplicationController

  needs_environment

  acts_as_design_block

  CONTROL_ACTION_OPTIONS = {
    'edit' => _('Edit')
  } 
 
  def index
    @menu_itens = @environment.top_level_articles
    design_render :controller => 'menu_website', :action => 'index'
  end
  
  ###########################
  # Other Sample of methods
  ###########################
  
  def edit
    design_render_on_edit
  end
  
  def save
    @design_block.update_attributes(params[:design_block])
    design_render_on_edit :nothing => true
  end


end
