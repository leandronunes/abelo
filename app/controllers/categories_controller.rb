class CategoriesController < ApplicationController

  needs_organization


  uses_configurations_tabs


  CATEGORY_TYPES = %w[
    customer
    worker
    supplier
    product
    contact
  ]

  # Show all available categories of the system
  def index
    redirect_to :action => 'list', :category_type => 'customer'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  post_only [ :destroy, :create, :update ]

  def autocomplete_category_name
    escaped_string = Regexp.escape(params[:category][:name])
    re = Regexp.new(escaped_string, "i")
    @category_type = params[:category_type] if CATEGORY_TYPES.include?(params[:category_type])
    render_access_denied_screen if @category_type.blank?
    @categories = @organization.send("#{@category_type}_categories").select { |cat| cat.name.match re}
    render :layout=>false
  end

  def list
    @query = params[:query]
    @query ||= params[:category][:name] if params[:category]
    @category_type = params[:category_type]    
    if CATEGORY_TYPES.include?(@category_type)
      if @query.nil?
        @categories = @organization.send("#{@category_type}_categories")
        @category_pages, @categories = paginate_by_collection @categories
      else
        @categories = @organization.send("#{@category_type}_categories").full_text_search(@query)
        @category_pages, @categories = paginate_by_collection @categories
      end
    else
      render_error(_("This type didn't exist"))
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_type = params[:category_type]
  end

  def new
    @category_type = params[:category_type]
    if CATEGORY_TYPES.include?(@category_type)
      @category = Category.new
      @category.organization = @organization
      render :action => 'new'
    else 
      render_error(_("This type didn't exist"))
    end
  end

  def create
    @category_type = params[:category_type]
    if CATEGORY_TYPES.include?(@category_type)
      @category = eval("#{@category_type.camelize}Category").new(params[:category])
      @category.organization = @organization
      if @category.save
        flash[:notice] = _('Category was successfully created.')
        redirect_to :action => 'list', :category_type => @category_type
      else
        render :action => 'new' 
      end
    else
      render_error(_("This type didn't exist"))
    end

  end

  def edit
    @category = @organization.categories.find(params[:id])
    @category_type = params[:category_type]
  end

  def update
    @category_type = params[:category_type]
    @category = @organization.categories.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = _('Category was successfully updated.')
      redirect_to :action => 'list', :category_type => @category.class.to_s.gsub(/Category/,'').downcase
    else
      render :action => 'edit', :id => @category
    end
  end

  def destroy
    category = @organization.categories.find(params[:id])
    category_type  = category.class.to_s.gsub(/Category/,'').downcase
    category.destroy
    redirect_to :action => 'list', :category_type => category_type
  end

end
