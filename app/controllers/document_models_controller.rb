class DocumentModelsController < Documents

#Searchs on all model document.
  def autocomplete_name
    escaped_string = Regexp.escape(params[:document][:name])
    re = Regexp.new(escaped_string, "i")
    @documents = @organization.documents_model.select { |d| d.name.match re}
    render :layout=>false
  end


end
