class Attachment < ActiveRecord::Base

  #FIXME implents it
  belongs_to :mass_mail
  validates_presence_of :file #, :description
  file_column :file



end
