class Image < ActiveRecord::Base

  belongs_to :product
  validates_presence_of :description, :picture
  file_column :picture, :magick => {
    :versions => { :thumb => '120x120', :medium => '320x240' }
  }

end
