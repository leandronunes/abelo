class Money < Payment

  def describe
    self.class.describe('money')
  end

end
