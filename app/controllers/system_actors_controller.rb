class SystemActorsController < ApplicationController

  SYSTEM_ACTORS = %w[
    customer
    worker 
    supplier
  ]

  auto_complete_for :system_actor, :name

  needs_organization

  before_filter :create_register_tabs

  def autocomplete_name
    actor = params[:actor].camelize
    escaped_string = Regexp.escape(params[:system_actor][:name])
    re = Regexp.new(escaped_string, "i")
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
    @actor = params[:actor] = 'worker' if @actor.blank?

    if params[:query]
      @query = params[:query]
    else
      @query = params[:system_actor] ? params[:system_actor][:name] : nil
    end
    if !@query.nil?
      items_per_page = 10
      offset = ((params[:page] || 1).to_i - 1) * items_per_page
      @total, @system_actors = eval("#{@actor.camelize}").full_text_search(@query)
      @system_actor_pages = pages_for(@total, :per_page => items_per_page)
      @system_actors = @system_actors[offset..(offset + items_per_page - 1)]
    else
      @system_actor_pages, @system_actors = paginate @actor.to_sym, :per_page => 10, :conditions => ["organization_id = ?", @organization.id ] 
    end
  end

  def show
    @system_actor = @organization.system_actors.find(params[:id])
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
    @system_actor = @organization.system_actors.find(params[:id])
    @actor = @system_actor.type.to_s.downcase
  end

  def update
    @system_actor = @organization.system_actors.find(params[:id])
    @actor = @system_actor.type.to_s.downcase if SYSTEM_ACTORS.include?(@system_actor.type.to_s.downcase)
    if @actor.blank?
      render_error(_("This actor it's not valid"))
      return
    end

    if @system_actor.update_attributes(params[:system_actor])
      flash[:notice] = _('%s was successfully updated.') % SystemActor.describe(@actor)
      redirect_to :action => 'list', :actor => @actor
    else
      render :partial => 'form',:layout => false, :status => HTTP_FORCE_ERROR
    end
  end

  def destroy
    @actor = @organization.system_actors.find(params[:id]).destroy.type.to_s.downcase
    redirect_to :action => 'list', :actor => @actor 
  end

  def reset
    @actor = params[:actor]
    @system_actor =  eval("#{@actor.camelize}").new()
    @system_actor.organization = @organization
    render :partial => 'form'
  end

end
