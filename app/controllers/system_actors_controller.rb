class SystemActorsController < ApplicationController

  SYSTEM_ACTORS = %w[
    customer
    worker 
    supplier
  ]

  auto_complete_for :system_actor, :name

  needs_organization

  def autocomplete_name
    actor = params[:type].camelize
    re = Regexp.new("#{params[:system_actor][:name]}", "i")
    @system_actors = SystemActor.find(:all, :conditions => [ "type = ?", actor ]).select { |sa| sa.name.match re}
    render :layout=>false
  end

  def index
    actor = 'worker'
    redirect_to :action => 'list', :actor => actor
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @actor = params[:actor] if SYSTEM_ACTORS.include?(params[:actor])
#TODO see the better way to launch the exception
    render_access_denied_screen if @actor.blank?

    @query =  params[:query] ? params[:query] : nil
    if @query.nil?
      @query = params[:system_actor] ? params[:system_actor][:name] : nil
    end

    if !@query.nil?
      page = (params[:page] || 1).to_i
      items_per_page = 1
      offset = (page - 1) * items_per_page

      @system_actors = eval("#{@actor.camelize}").find_by_contents(@query, {:limit => :all, :offset => 0})
      @system_actor_pages = Paginator.new(self, @system_actors.size, items_per_page, page)
      @system_actors = @system_actors[offset..(offset + items_per_page - 1)]
    else
      @system_actor_pages, @system_actors = paginate @actor.to_sym, :per_page => 1, :conditions => ["organization_id = ?", @organization.id ] 
    end
    @system_actor = SystemActor.new 
  end

  def show
    @worker = @organization.workers.find(params[:id])
  end

  def new
    @actor = params[:actor] if SYSTEM_ACTORS.include?(params[:actor])
    render_access_denied_screen if @actor.blank?
    @system_actor =  eval("#{@actor.camelize}").new() 
    @system_actor.organization = @organization
  end

  def create
    @actor = params[:actor] if SYSTEM_ACTORS.include?(params[:actor])
    if @actor.blank?
      render_error(_("This actor it's not valid"))
      return
    end

    @system_actor = eval("#{@actor.camelize}").new(params[:system_actor])
    @system_actor.organization = @organization
    if @system_actor.save
      flash[:notice] = _('%s was successfully created.') % @actor
      redirect_to :action => 'list', :actor => @actor
    else
      render :action => 'new', :actor => @actor, :status => HTTP_FORCE_ERROR
    end
  end

  def edit
    @actor = params[:actor] if SYSTEM_ACTORS.include?(params[:actor])
    if @actor.blank?
      render_error(_("This actor it's not valid"))
      return
    end
    @system_actor = @organization.system_actors.find(params[:id])
    render :partial => 'edit', :layout => false
  end

  def update
    @actor = params[:actor] if SYSTEM_ACTORS.include?(params[:actor])
    if @actor.blank?
      render_error(_("This actor it's not valid"))
      return
    end

    @system_actor = @organization.system_actors.find(params[:id])
    if @system_actor.update_attributes(params[:system_actor])
      flash[:notice] = _('%s was successfully updated.') % SystemActor.describe(@actor)
      redirect_to :action => 'list', :actor => @actor
    else
      render :partial => 'form',:layout => false, :status => HTTP_FORCE_ERROR
    end
  end

  def destroy
    @organization.workers.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def reset
    render :partial => 'new'
  end

end
