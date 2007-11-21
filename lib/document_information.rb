module DocumentInformation

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def acts_as_documentable(config = {})
      raise "You have to define a model to use these documents actions. Ex: :model => 'department'" if config[:model].nil?
      @documentable_config = config

      def config
        @documentable_config
      end

      include DocumentInformation::InstanceMethods
      helper DocumentInformation::Helper

    end

  end

  module InstanceMethods

    def config
      self.class.config
    end

    def choose_document
      instance_variable_set("@#{config[:model]}", @organization.send(config[:model].pluralize).find(params[:id]))
      @document_models = @organization.documents_model
    end


    def autocomplete_document_name
      object = @organization.send(config[:model].pluralize).find(params[:id])
      escaped_string = Regexp.escape(params[:document][:name])
      re = Regexp.new(escaped_string, "i")
      @documents = object.documents.find(:all).select { |sa| sa.name.match re}
      render :layout=>false
    end

    def list_document
      @query || params[:query]
      @query ||=  params[:document][:document_name] if params[:document]
      var = instance_variable_set("@#{config[:model]}", @organization.send(config[:model].pluralize).find(params[:id]))
      @documents = @query.blank? ? var.documents : var.documents.full_text_search(@query)
      @document_pages, @documents = paginate_by_collection @documents
    end
  
    def new_document
      if params[:model_id]
        model = @organization.documents.find(params[:model_id])
        @document = model.dclone
        @title = _('New Document from model %s') % model.name
      else
        @document = Document.new
        @title =  _('New Blank Document')
      end
      @departments = @organization.departments
    end
  
    def create_document
      @document = Document.new(params[:document])
      @document.organization = @organization
      @document.owner = @organization.send(config[:model].pluralize).find(params[:id])
      if @document.save
        flash[:notice] = _('The document was successfully created.')
        redirect_to :action => 'list_document', :actor => params[:actor], :id => params[:id]
      else
        @departments = @organization.departments
        render :action => 'new_document', :actor => params[:actor], :id => params[:id]
      end
    end
  
    def show_document
      instance_variable_set("@#{config[:model]}", @organization.send(config[:model].pluralize).find(params[:id]))
      @document = @organization.documents.find(params[:document_id])
    end
  
    def edit_document
      instance_variable_set("@#{config[:model]}", @organization.send(config[:model].pluralize).find(params[:id]))
      @document = @organization.documents.find(params[:document_id])
      @departments = @organization.departments
    end
  
    def update_document
      @document = @organization.documents.find(params[:document_id])
      if @document.update_attributes(params[:document])
        flash[:notice] = 'Document was successfully updated.'
        redirect_to :action => 'show_document', :document_id => @document, :actor => params[:actor], :id => params[:id]
      else
        @departments = @organization.departments
        render :action => 'edit_document'
      end
    end
  
    def destroy_document
      @document = @organization.documents.find(params[:document_id]).destroy
      redirect_to :action => 'list_document', :actor => params[:actor], :id => params[:id]
    end

  end

  module Helper
    def display_documents_list_options(object, method, params = {})
      [
        form_tag({:action => 'list_document'}.merge(params), :class => 'search_itens'),
          display_autocomplete(object, method, params),
          button('search', _('Search Document'), :search),
          button('add', _("Add New Document"), :new, {:action => 'choose_document'}.merge(params) ),
          button('reset', _('Reset document search'), :list, {:action => 'list_document'}.merge(params)),
        '</form>'
      ].join("\n")

    end
    def display_document_collection(collection = Array.new, params = {}, html_options = {})
      content = Array.new
      collection.each do |c|
        content.push(
          [
            display_document_collection_options(c, params),
            display_info(c, html_options, true )
          ]
        )
      end

      display_list_info(content, html_options)

    end

    def display_document_collection_options(item, params = {}, html_options = {})
      content_tag(:div,
        [
          button('view_small', _('Show'), :show, {:action => 'show_document', :document_id => item.id}.merge(params)),
          button('edit_small', _('Edit'), :edit, {:action => 'edit_document', :document_id => item.id}.merge(params)),
          button('del_small', _('Destroy'), :destroy, {:action => 'destroy_document', :document_id => item.id}.merge(params),
                 :method => 'post', :confirm => _('Are you sure?'))
        ].join("\n"),
        :class => 'list_item_button'
      )
    end
    def display_show_info_documents_options(object, params = {},  html_options = {})
      content_tag(:div,
        [
          button('back', _('Back'), :back, {:action => 'list_document'}.merge(params)),
          button('edit', _('Edit'), :edit, {:action => 'edit_document', :document_id => object.id}.merge(params))
        ].join("\n"),
        html_options
      )
    end

  end

end

#ActionController::Base.class_eval do
#  include ActsAsDesignBlock
#end


