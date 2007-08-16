class LinkBlock < Design::Block

  def content
    Organization.find(:all).map{|p| p.name}
  end

end
