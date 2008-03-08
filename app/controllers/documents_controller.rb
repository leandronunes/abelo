class DocumentsController < ApplicationController

  auto_complete_for :document, :name

  needs_organization
  
  before_filter :create_tabs

  # Search on a non model document of based on a given model or a document without a model
  def autocomplete_document_name
    escaped_string = Regexp.escape(params[:document][:name])
    re = Regexp.new(escaped_string, "i")
    if params[:document_model_id]
      @documents = @organization.documents_by_model(params[:document_model_id]).select { |d| d.name.match re}
    elsif params[:models_list]
      @documents = @organization.documents_model.select { |d| d.name.match re}
    else
      @documents = @organization.documents_without_model.select { |d| d.name.match re} 
    end
    render :layout=>false
  end

  def index
    redirect_to :action => 'list', :models_list => true
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @query || params[:query]
    @query ||=  params[:document][:name] if params[:document]
    if params[:document_model_id]
      model = Document.find(params[:document_model_id])
      @documents = @query.blank? ? @organization.documents_by_model(model) : @organization.documents_by_model(model).full_text_search(@query)
      @title = _('Listing Documents from Model %s') % model.name
    elsif params[:models_list]
      @title = _('Listing Document Models')
      @documents = @query.blank? ? @organization.documents_model : @organization.documents_model.full_text_search(@query)
    else
      @title = _('Listing Documents without Models')
      @documents = @query.blank? ? @organization.documents_without_model : @organization.documents_without_model.full_text_search(@query)
    end
    @document_pages, @documents = paginate_by_collection @documents
  end

  def show
    @document = @organization.documents.find(params[:id])
  end

  def new
    begin
      model = @organization.documents.find(params[:document_model_id])
      @document = model.dclone
      @title = _('New Document from model %s') % model.name
    rescue
      params[:models_list] ? @title = _('New Document Model') : @title = _('New Blank Document')
      @document = Document.new
    end
    @departments = @organization.departments
    @customers = @organization.customers
    @workers = @organization.workers
    @suppliers = @organization.suppliers
  end

  def create
    @document = Document.new(params[:document])  
    @document.organization = @organization
    @document.document_model_id = params[:document_model_id] if params[:document_model_id]
    @document.is_model = true if params[:models_list] and !params[:document_model_id]
    if @document.save
      flash[:notice] = _('The document was successfully created.')
      redirect_to :action => 'list', :models_list => params[:models_list], :document_model_id => params[:document_model_id]
    else
      @departments = @organization.departments
      if !@document.is_model? and !@document.document_owner_type.nil?
        @owner_type = @document.document_owner_type
        self.instance_variable_set("@#{@document.document_owner_type.pluralize}", @organization.send(@document.document_owner_type.pluralize))
      end
      render :action => 'new', :models_list => params[:models_list], :document_model_id => params[:document_model_id]
    end
  end

  def edit
    @document = @organization.documents.find(params[:id])
    @departments = @organization.departments

    unless @document.is_model?
      @owner_type = @document.document_owner_type
      self.instance_variable_set("@#{@document.document_owner_type.pluralize}", @organization.send(@document.document_owner_type.pluralize))
    end

    if params[:models_list] and params[:document_model_id].nil?
      @title = _('Editing Model Document')
    else
      @title = _('Editing Document')
    end
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:document])
      flash[:notice] = _('Document was successfully updated.')
      redirect_to :action => 'show', :id => @document, :models_list => params[:models_list], :document_model_id => params[:document_model_id]
    else
      @departments = @organization.departments
      @customers = @organization.customers
      @workers = @organization.workers
      @suppliers = @organization.suppliers
      render :action => 'edit'
    end
  end

  def destroy
    Document.find(params[:id]).destroy
    redirect_to :action => 'list', :models_list => params[:models_list], :document_model_id => params[:document_model_id]
  end

  def create_tabs
    t = add_tab do      
      links_to :controller => 'documents', :action => 'list', :models_list => 'true'
      in_set 'first'
      highlights_on :controller => 'documents', :models_list => 'true'
    end
    t.named _("Models")
   
    t = add_tab do      
      links_to :controller => 'documents', :action => 'list'
      in_set 'first'
      highlights_on :controller => 'documents'
      highlights_off :controller => 'documents', :models_list => 'true'
    end
    t.named _('Documents')
  end

  def list_owners
    @document = Document.new(params[:document])
    @owner_type = params[:value].downcase
    @customers = @organization.customers
    @workers = @organization.workers
    @suppliers = @organization.suppliers
    render :partial => 'owners_list'
  end

  def find_by_tag
    @collection = params[:collection].split(',').map{|id| Document.find(id)}
    @documents = Document.find_tagged_with(params[:tag]) & @collection
    @document_pages, @documents = paginate_by_collection @documents
    @model = true if @collection.first.is_model? 
    render :partial => 'documents_list'
  end

  def print
    @document = @organization.documents.find(params[:id])
    @departments = @document.departments
    render :template => 'documents/print', :layout => false
  end

end
