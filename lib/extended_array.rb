class Array

  def ids
    self.collect{|c| c.id }.join(',')
  end

end
