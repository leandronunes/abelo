class DocumentItemsController < ApplicationController

  needs_organization

  def new
    @document_item = DocumentItem.new
    @document_section_id = params[:id]
    @document_id = params[:document_id]
    render :partial => 'new'
  end

  def add
    @document_item = DocumentItem.new(params[:document_item])
    @document_item.document_section_id = params[:id]
    if @document_item.save
      @document = Document.find(params[:document_id])
      @sections = @document.document_sections
      render :partial => 'document_sections/list'
    else
      render :partial => 'new', :id => params[:id], :document_id => params[:document_id], :status => HTTP_FORCE_ERROR
    end
  end
 
  def edit
    @document_item = DocumentItem.find(params[:id])
    @document_id = params[:document_id]
    render :partial => 'edit'
  end

  def update
    @document_item = DocumentItem.find(params[:id])
    if @document_item.update_attributes(params[:document_item])
      @document = Document.find(params[:document_id])
      @sections = @document.document_sections
      flash[:notice] = _('Document proposal item was successfuly updated.')
      render :partial => 'document_sections/list'
    else
      render :text => 'blih' 
    end
  end

  def destroy
    DocumentItem.find(params[:id]).destroy
    @document = Document.find(params[:document_id])
    @sections = @document.document_sections
    render :partial => 'document_sections/list'
  end

  def cancel   
    render :nothing => true
  end
  
end
