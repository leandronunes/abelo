class MassMailGroupsController < ApplicationController

  auto_complete_for :mass_mail_group, :name

  needs_organization

  uses_mass_mails_tabs

  GROUP_TYPES = %w[
    customer
    worker
  ]

  def autocomplete_mass_mail_group_name
    escaped_string = Regexp.escape(params[:mass_mail_group][:name])
    re = Regexp.new(escaped_string, "i")

    @group_type = params[:group_type] if GROUP_TYPES.include?(params[:group_type])
    render_access_denied_screen if @group_type.blank?
    @mass_mail_groups = @organization.send("#{@group_type}_groups").select { |g| g.name.match re}
    render :layout => false
  end

  def index
    list  
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @query = params[:query]
    @query ||= params[:mass_mail_group][:name] if params[:mass_mail_group]
    @group_type = params[:group_type] || GROUP_TYPES.first
    if GROUP_TYPES.include?(@group_type)
      if @query.nil?
        @mass_mail_groups = @organization.send("#{@group_type}_groups")
        @mass_mail_groups_pages, @mass_mail_groups = paginate_by_collection @mass_mail_groups
      else
        @mass_mail_groups = @organization.send("#{@group_type}_groups").full_text_search(@query)
        @mass_mail_groups_pages, @mass_mail_groups = paginate_by_collection @mass_mail_groups
      end
    else
      render_error(_("This type doesn't exist"))
    end
  end

  def show
    @mass_mail_group = @organization.mass_mail_groups.find(params[:id])
    @group_type = params[:group_type] || @mass_mail_group.class.to_s.gsub(/Group/,'').downcase
  end

  def new
    @group_type = params[:group_type]
    if GROUP_TYPES.include?(@group_type)
      @mass_mail_group = MassMailGroup.new
      @mass_mail_group.organization = @organization
    else 
      render_error(_("This type doesn't exist"))
    end
  end

  def create
    @group_type = params[:group_type]
    if GROUP_TYPES.include?(@group_type)
      @mass_mail_group = eval("#{@group_type.camelize}Group").new(params[:mass_mail_group])
      @mass_mail_group.organization = @organization 
      if @mass_mail_group.save
        flash[:notice] = t(:group_was_successfully_created)
        redirect_to :action => 'list', :group_type => @group_type
      else
        render :action => 'new'
      end
    else
      render_error(_("This type doesn't exist"))
    end
  end

  def edit
    @mass_mail_group = @organization.mass_mail_groups.find(params[:id])
    @group_type = params[:group_type]
  end

  def update
    @group_type = params[:group_type]
    @mass_mail_group = @organization.mass_mail_groups.find(params[:id])
    if @mass_mail_group.update_attributes(params[:mass_mail_group])
      flash[:notice] = t(:group_was_successfully_updated)
      redirect_to :action => 'list', :group_type => @group_type
    else
      render :action => 'edit'
    end
  end

  def destroy
    mass_mail_group = @organization.mass_mail_groups.find(params[:id])
    group_type  = mass_mail_group.class.to_s.gsub(/Group/,'').downcase
    mass_mail_group.destroy
    redirect_to :action => 'list', :group_type => group_type
  end

  def remove_system_actors
    @mass_mail_group = @organization.mass_mail_groups.find(params[:id])
    @group_type = @mass_mail_group.class.to_s.gsub(/Group/,'').downcase
    render :layout => false
  end

  def remove_system_actor
    @mass_mail_group = @organization.mass_mail_groups.find(params[:id])
    system_actors = params[:options]
    if system_actors
      system_actors.keys.each {
        |s|
        @mass_mail_group.system_actors.delete @mass_mail_group.system_actors.find(s)
      }
     redirect_to :action => 'show', :id => @mass_mail_group
    end
  end

  def add_system_actors
    @mass_mail_group = @organization.mass_mail_groups.find(params[:id])
    @group_type = @mass_mail_group.class.to_s.gsub(/Group/,'').downcase
    render :layout => false
  end

  def add_system_actor
    @mass_mail_group = @organization.mass_mail_groups.find(params[:id])
    system_actors = params[:options]
    if system_actors
      system_actors.keys.each { 
      	|s|
        @mass_mail_group.system_actors << @organization.system_actors.find(s)
      }
      redirect_to :action => 'show', :id => @mass_mail_group
    end
  end

  def search_system_actor
    @mass_mail_group = @organization.mass_mail_groups.find(params[:id])
    group_type = @mass_mail_group.class.to_s.gsub(/Group/,'').downcase
    str = params[:search].blank? ? '*' : params[:search]
    @searched = @organization.send("#{group_type.pluralize}").full_text_search(str)
    @searched = @searched - @mass_mail_group.system_actors
    render :action => 'result_search', :layout => false
  end
end
