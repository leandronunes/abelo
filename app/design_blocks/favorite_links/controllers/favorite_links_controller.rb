class FavoriteLinksController < ApplicationController

#  needs_organization

#  acts_as_design_block

  CONTROL_ACTION_OPTIONS = {
    'edit' => _('Edit'),
    'manage_links' => _('Manage Links')
  }

  def index
    get_favorite_links
    design_render :controller => 'favorite_links', :action => 'index'
  end

  def edit
    design_render_on_edit :controller => 'favorite_links', :action => 'edit'
  end

  def save
    if @design_block.update_attributes(params[:design_block])
      get_favorite_links
      design_render_on_edit :controller => 'favorite_links', :action => 'manage_links'
    else
      design_render_on_edit :nothing => true
    end
  end

  def manage_links
    get_favorite_links
    design_render_on_edit :controller => 'favorite_links', :action => 'manage_links'
  end

  def add_link
    design_render_on_edit :controller => 'favorite_links', :action => 'add_link'
  end

  def remove_link
    @design_block.delete_link(params[:link])
    get_favorite_links
    design_render_on_edit :controller => 'favorite_links', :action => 'manage_links'
  end

  def get_favorite_links
    favorite_links = @design_block.favorite_links
    @favorite_links_pages, @favorite_links = paginate_by_collection favorite_links
  end

  def paginate_by_collection(collection, options = {})
#    page = params[:page].blank? ? 1 : params[:page].to_i
    begin
      page = params[:page].to_i
    rescue Exception => e
      page = 1
    end
    items_per_page = @design_block.limit_number
    offset = (page - 1) * items_per_page
    link_pages = Paginator.new(self, collection.size, items_per_page, page)
    collection = collection[offset..(offset + items_per_page - 1)]
    return link_pages, collection
  end

end
