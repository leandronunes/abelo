class DocumentSectionsController < ApplicationController

  def new
    @document_section = DocumentSection.new
    @document_id = params[:id]
    render :partial => 'new'
  end

  def add
   @document_section = DocumentSection.new(params[:document_section])
   @document_section.document = Document.find(params[:id])
   if @document_section.save
     @document = Document.find(params[:id])
     @sections = @document.document_sections
     render :partial => 'list' 
   else  
      render :partial => 'new', :id => params[:id], :status => HTTP_FORCE_ERROR
   end
  end

  def edit
    @document_section = DocumentSection.find(params[:id])
    @document_id = params[:document_id]
    render :template => 'document_sections/edit', :layout => false
  end

  def update
    @document_section = DocumentSection.find(params[:id])
    if @document_section.update_attributes(params[:document_section])
      @document = Document.find(params[:document_id])
      @sections = @document.document_sections
      flash[:notice] = t(:document_section_was_successfuly_updated)
      render :partial => 'list'
    else
    end
  end
  
  def destroy
    DocumentSection.find(params[:id]).destroy
    @document = Document.find(params[:document_id])
    @sections = @document.document_sections
    render :partial => 'list'
  end

  def set_name
    @document_section =  DocumentSection.find(params[:id])
    if @document_section.update_attributes(:name => params[:value])
      render :text => @document_section.name
    else
      render :text => DocumentSection.find(params[:id]).name
    end
  end

  def cancel
    render :nothing => true
  end

end
