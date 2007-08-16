class ListBlock < Design::Block

  def content
    Department.find(:all).map{|p|p.name}
  end
end
