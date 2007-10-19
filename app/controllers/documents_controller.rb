class DocumentsController < ApplicationController

  auto_complete_for :document, :name

  needs_organization
  
  before_filter :create_tabs


#Search on a non model document of based on a given model or a document without a model
  def autocomplete_name
    escaped_string = Regexp.escape(params[:document][:name])
    re = Regexp.new(escaped_string, "i")
    if params[:document_model_id]
      @documents = @organization.documents_by_model.select { |d| d.name.match re}
    elsif params[:models_list]
      @documents = @organization.documents_model.select { |d| d.name.match re}
    else
      @documents = @organization.documents_without_model.select { |d| d.name.match re} 
    end
    render :layout=>false
  end

  def index
    redirect_to :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @query || params[:query]
    @query ||=  params[:document][:name] if params[:document]
    begin
      @documents = @query.blank? ? @organization.documents_by_model(params[:document_model_id]) : @organization.documents_by_model(params[:document_model_id]).full_text_search(@query)
      @title = _('Listing Documents from Model %s') % Document.find(params[:document_model_id]).name
    rescue
      if params[:models_list]
        @title = _('Listing Document Models')
        @documents = @query.blank? ? @organization.documents_model : @organization.documents_model.full_text_search(@query)
        @document_pages, @documents = paginate_by_collection @documents
        render :template => 'documents/list_models'
        return
      else
        @title = _('Listing Documents without Models')
        @documents = @query.blank? ? @organization.documents_without_model : @organization.documents_without_model.full_text_search(@query)
      end
    end
    @document_pages, @documents = paginate_by_collection @documents
  end

  def show
    @document = @organization.documents.find(params[:id])
    @departments = @document.departments
  end

  def new
    begin 
      @document = Document.find(params[:document_model_id]).dclone
      @title = _('New Document from model %s') % Document.find(params[:document_model_id]).name
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
     
    if @document.save
      flash[:notice] = _('The document was successfully created.')
      redirect_to :action => 'list', :models_list => params[:models_list]
    else
      @departments = @organization.departments
      render :action => 'new', :models_list => params[:models_list], :document_model_id => params[:document_model_id]
    end
  end

  def edit
    @document = @organization.documents.find(params[:id])
    @departments = @organization.departments
    params[:models_list] ? @title = _('Editing Model Document') : @title = _('Editing Document')
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

  def create_tabs
    t = add_tab do      
      links_to :controller => 'documents', :action => 'list', :models_list => 'true'
      in_set 'first'
      highlights_on :controller => 'documents', :models_list => 'true'
    end
    t.named _("Models")
   
    t = add_tab do      
      links_to :controller => 'documents'
      in_set 'first'
      highlights_off :controller => 'documents', :models_list => 'true'
    end
    t.named _('Other Documents')
  end

end
