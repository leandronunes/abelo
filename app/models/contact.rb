class Contact < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true
  validates_presence_of :name

  #FIXME make this test
  def responsible
    self.name
  end

end
