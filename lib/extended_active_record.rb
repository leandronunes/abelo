class ActiveRecord::Base

  def display_class
    self.class.name + "Display"
  end

end
