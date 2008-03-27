module ContentViewerHelper

  def link_to_document(doc, text = nil)
    text ||= doc.title
    path = doc.path.split(/\//)
    link_to text, homepage_path(:profile => doc.environment.identifier , :page => path)
  end

end
