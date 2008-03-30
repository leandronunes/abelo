class CmsController <  ApplicationController

  #FIXME make the test for all controller

  uses_web_site_tabs

  #FIXME i think that we can put needs_organization here. See the better way after
  layout 'organization'
  before_filter :load_organization
  before_filter :load_environment 

  needs_organization

  ARTICLE_TYPES = [
    StoreArticle,
    TextArticle,
  ]

  def view
    @article = @environment.articles.find(params[:id])
    @subitems = @article.children
  end

   def index
    @article = nil
    @subitems = @environment.top_level_articles
    render :action => 'view'
  end

  def edit
    @article = @environment.articles.find(params[:id])
  end

  def update 
    @article = @environment.articles.find(params[:id])
    @article.last_changed_by = user
    if @article.update_attributes(params[:article])
      redirect_to :action => 'view', :id => @article.id
    else
      render :action => 'edit'
    end
  end

  def new
    # user must choose an article type first
    type = params[:type]
    if type.blank?
      @article_types = []
      ARTICLE_TYPES.each do |type|
        @article_types.push({
          :name => type.name,
          :short_description => type.short_description,
          :description => type.description
        })
      end
      render :action => 'select_article_type', :layout => false
      return
    end

    raise "Invalid article type #{type}" unless ARTICLE_TYPES.map {|item| item.name}.include?(type)
    klass = type.constantize
    @article = klass.new(params[:article])
  end

  def order
    begin 
      @article = @environment.articles.find(params[:id])
    rescue
      @article = nil
    end

    render :nothing and return if params["list_items"].nil?

    params["list_items"].each_with_index do |article_id,position|
     begin
        a = @environment.articles.find(article_id)
      rescue
        next
      end
      a.position = position
      a.save!
    end

    @subitems = @article.nil? ? @environment.top_level_articles : @article.children
    render :partial => 'subitems'
  end

  def create
    # user must choose an article type first
    type = params[:type]
    if type.blank?
      @article_types = []
      ARTICLE_TYPES.each do |type|
        @article_types.push({
          :name => type.name,
          :short_description => type.short_description,
          :description => type.description
        })
      end
      render :action => 'select_article_type', :layout => false
      return
    end

    raise "Invalid article type #{type}" unless ARTICLE_TYPES.map {|item| item.name}.include?(type)
    klass = type.constantize
    @article = klass.new(params[:article])

    if params[:parent_id]
      parent = @environment.articles.find(params[:parent_id])
      if ! parent.allow_children?
        raise ArgumentError.new("cannot create child of article which does not accept children")
      end
      @article.parent = parent
    end

    @article.environment = @environment
    @article.last_changed_by = user
    if @article.save
      redirect_to :action => 'view', :id => @article.id
    else
      render :action => 'new'
    end
  end

  #FIXME see if it's usefull
  post_only :set_home_page
  def set_home_page
    @article = @environment.articles.find(params[:id])
    @environment.home_page = @article
    @environment.save!
    flash[:notice] = _('Article "%s" configured as home page.') % @article.name
    redirect_to :action => 'view', :id => @article.id
  end

  #FIXME see if it's usefull
  post_only :destroy
  def destroy
  raise "fudeu %s" % request.post?
    @article = @environment.articles.find(params[:id])
    @article.destroy
    redirect_to :action => (@article.parent ? 'view' : 'index'), :id => @article.parent
  end

end
