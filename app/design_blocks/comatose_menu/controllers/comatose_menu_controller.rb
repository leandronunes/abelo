class ComatoseMenuController < ApplicationController

  CONTROL_ACTION_OPTIONS = {
    'edit' => _('Edit')
  } 
 
  def index
    root_page = Article.find_by_path(params[:organization_nickname])
    @menu_itens = root_page.children
    design_render :controller => 'comatose_menu', :action => 'index'
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
