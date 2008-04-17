class Contact < ActiveRecord::Base

  #FIXME make the test for all model
  belongs_to :owner, :polymorphic => true

  #FIXME make this test
  def responsible
    self.name
  end

end
