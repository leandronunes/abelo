class CmsController <  ApplicationController

  #FIXME make the test for all controller

  uses_web_site_tabs

  #FIXME i think that we can put needs_organization here. See the better way after
  layout 'organization'
  before_filter :load_organization
  before_filter :load_environment 

  needs_organization

  design :interface_holder => 'organization', :content_holder => 'environment'

# FIXME remove this
#  define_option :page_class, Article
#

  ARTICLE_TYPES = [
    StoreArticle,
    TextArticle,
#    RssFeed,
#    UploadedFile,
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
    if request.post?
      @article.last_changed_by = user
      if @article.update_attributes(params[:article])
        redirect_to :action => 'view', :id => @article.id
        return
      end
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


    if params[:parent_id]
      parent = @environment.articles.find(params[:parent_id])
      if ! parent.allow_children?
        raise ArgumentError.new("cannot create child of article which does not accept children")
      end
      @article.parent = parent
    end

    @article.environment = @environment
    @article.last_changed_by = user
    if request.post?
      if @article.save
        redirect_to :action => 'view', :id => @article.id
        return
      end
    end

    render :action => 'edit'
  end

  post_only :set_home_page
  def set_home_page
    @article = @environment.articles.find(params[:id])
    @environment.home_page = @article
    @environment.save!
    flash[:notice] = _('Article "%s" configured as home page.') % @article.name
    redirect_to :action => 'view', :id => @article.id
  end

  post_only :destroy
  def destroy
  raise "fudeu %s" % request.post?
    @article = @environment.articles.find(params[:id])
    @article.destroy
    redirect_to :action => (@article.parent ? 'view' : 'index'), :id => @article.parent
  end



end
