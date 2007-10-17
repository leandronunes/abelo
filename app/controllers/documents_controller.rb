class DocumentsController < ApplicationController

  auto_complete_for :document, :name

  needs_organization
  
  before_filter :create_tabs


#TODO fix this autocomplete field because it searchs on all non model document.
#And in this case it must search only on a non model document of based on a given model
  def autocomplete_name
    escaped_string = Regexp.escape(params[:document][:name])
    re = Regexp.new(escaped_string, "i")
    @documents = @organization.documents.find(:all, :conditions => ['is_model = ?', true]).select { |d| d.name.match re}
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
    if params[:show_document_models]
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
    @departments = @document.departments
  end

  def new
    begin 
      @document = Document.find(params[:document_model]).dclone
      @document.save
      redirect_to :action => 'edit', :id => @document.id, :document_model => @document.document_model.id
    rescue
      @document = Document.new
    end
    @departments = @organization.departments
  end

  def create
    @document = Document.new(params[:document])  
    @document.organization = @organization
    @document.is_model = true
     
    if @document.save
      flash[:notice] = _('The document was successfully created.')
      redirect_to :action => 'edit', :id => @document.id
    else
      @departments = @organization.departments
      render :action => 'new'
    end
  end

  def edit
    @document = @organization.documents.find(params[:id])
    @departments = @organization.departments
    @sections = @document.document_sections
  end

#TODO see if it's usefull
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

#TODO see if it's usefull
  def destroy
    Document.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def create_tabs
    t = add_tab do      
      links_to :controller => 'documents', :action => 'list', :show_document_models => 'true'
      in_set 'first'
      highlights_on :controller => 'documents', :show_document_models => 'true'
    end
    t.named _("Models")
   
    t = add_tab do      
      links_to :controller => 'documents'
      in_set 'first'
      highlights_off :controller => 'documents', :show_document_models => 'true'
    end
    t.named _('Other Documents')
  end

end
