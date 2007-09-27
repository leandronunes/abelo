class Article < Comatose::Page
  #TODO See the comatose better
  acts_as_taggable  
  
  def keywords
    tag_list.to_s
  end
  
  def keywords=(list_tag)
    self.tag_list = list_tag
  end

  def has_keyword?(keyword)
    tags.map{|t| t.name.downcase}.include?(keyword.downcase)
  end
end
