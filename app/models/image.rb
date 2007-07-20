class Image < ActiveRecord::Base

  validates_presence_of :description, :picture

  belongs_to :product

  file_column :picture, :magick => {
    :versions => { :thumb => '120x120', :medium => '320x240' }
  }

end
