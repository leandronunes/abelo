class DocumentsController < ApplicationController

  auto_complete_for :document, :name

  needs_organization
  
  before_filter :create_tabs

  def autocomplete_name
    is_template = params[:is_template] == 't' ? true : false
    re = Regexp.new("#{params[:document][:name]}", "i")
    @documents = Document.find(:all, :conditions => ['is_template = ?', is_template]).select { |cp| cp.name.match re}
    render :layout=>false
  end

  def index
    redirect_to :action => 'list', :is_template => 'false'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @is_template = params[:is_template]
    if @is_template == 'true'
      is_template = 't'
      @documents = @organization.documents_model
      @title = _('Documents Templates')
    else
      is_template = 'f'
      @documents = @organization.documents_not_model
      @title = _('Documents')
    end
    
    @query = params[:query] ? params[:query] : nil
    if @query.nil?
      @query = params[:document] ? params[:document][:name] : nil
    end

    if !@query.nil?
      page = (params[:page] || 1).to_i
      items_per_page = 10
      offset = (page - 1) * items_per_page

      @documents = Document.find_by_contents(@query, {:limit => :all, :offset => 0}, :conditions => ["is_template = ?", is_template])
      @document_pages = Paginator.new(self, @documents.size, items_per_page, page)
      @documents = @documents[offset..(offset + items_per_page - 1)]
    else 
      @document_pages, @documents = paginate :documents, :per_page => 10, :conditions => [ "organization_id = ? AND is_template = ?", @organization.id, is_template ]
    end
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @departments = @organization.departments
    render :partial => 'new'
  end

  def create
    @departments = @organization.departments
    @document = Document.new(params[:document])  
    @document.organization = @organization
    @sections = @document.document_sections
    if params[:template]
      template = Document.find(params[:template])
      @sections = template.document_sections
      @document.body = template.body
    end
    if @document.save
      flash[:notice] = _('The document was successfully created.')
      redirect_to :action => 'edit', :id => @document.id
    else
      @documents_templates = @organization.documents_templates
      @documents = @organization.documents_not_templates
      render :action => 'list'
    end
  end

  def edit
    @document = Document.find(params[:id])
    @departments = @organization.departments
    @sections = @document.document_sections
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:document])
      flash[:notice] = 'Document was successfully updated.'
      redirect_to :action => 'show', :id => @document
    else
      @departments = @organization.departments
      @sections = @document.document_sections
      render :action => 'edit'
    end
  end

  def destroy
    Document.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def new_from_template
    @document = Document.find(params[:id]).clone
    @document.name = ''
    @document.departments.clear
    @document.is_template = false
    @document.body = Document.find(params[:id]).body
    @departments = @organization.departments
    @sections = @document.document_sections
    render :action => 'new'
  end

  def get_template
    if params[:value] == '1'
      @templates = @organization.documents_templates
      render :partial => 'templates'
    else
      render :nothing => true
    end
  end

  def create_tabs
    t = add_tab do      
      links_to :controller => 'documents', :action => 'list', :is_template => 'true'
      in_set 'first'
      highlights_on :controller => 'documents', :is_template => 'true'
    end
    t.named _("Models")
    
    t = add_tab do      
      links_to :controller => 'documents', :action => 'list', :is_template => 'false'
      in_set 'first'
      highlights_on :controller => 'documents', :is_template => 'false'
    end
    t.named _('Documents')
  end

end
