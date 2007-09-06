class SystemActorsController < ApplicationController

  SYSTEM_ACTORS = {
    'customer' => _('Customer'),
    'worker' => _('Workers'),
    'supplier' => _('Supplier'),
  }

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
    
    @query = params[:query]
    @query ||= params[:system_actor][:name] if params[:system_actor]

    if @query.nil?
      @system_actors = @organization.system_actors.find(:all, :conditions => ["type = ?", @actor.camelize])
      @system_actor_pages, @system_actors = paginate_by_collection @system_actors
    else
      @system_actors = eval("#{@actor.camelize}").full_text_search(@query)
      @system_actor_pages, @system_actors = paginate_by_collection @system_actors
    end
  end

  def show
    @system_actor = @organization.system_actors.find(params[:id])
    @actor = params[:actor] if SYSTEM_ACTORS.include?(params[:actor])
    render_access_denied_screen if @actor.blank?
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
    @system_actor = @organization.send("#{@actor.pluralize}").find(params[:id])
  end

  def update
    @actor = params[:actor] if SYSTEM_ACTORS.include?(params[:actor])
    if @actor.blank?
      render_error(_("This actor it's not valid"))
      return
    end
    @system_actor = @organization.send("#{@actor.pluralize}").find(params[:id])

    if @system_actor.update_attributes(params[:system_actor])
      flash[:notice] = _('%s was successfully updated.') % SystemActor.describe(@actor)
      redirect_to :action => 'list', :actor => @actor
    else
      render :partial => 'form',:layout => false, :status => HTTP_FORCE_ERROR
    end
  end

  def destroy
    @actor = params[:actor] if SYSTEM_ACTORS.include?(params[:actor])
    if @actor.blank?
      render_error(_("This actor it's not valid"))
      return
    end
    @system_actor = @organization.send("#{@actor.pluralize}").find(params[:id])
    @system_actor.destroy
    redirect_to :action => 'list', :actor => @actor 
  end

  def get_person_type
    @actor = params[:actor] if SYSTEM_ACTORS.include?(params[:actor])
    render_access_denied_screen if @actor.blank?
    @system_actor =  eval("#{@actor.camelize}").new(params[:system_actor])
    if params[:value] == 'juristic'
      render :partial => 'juristic_person'
    else
      render :partial => 'natural_person'
    end
  end

end
