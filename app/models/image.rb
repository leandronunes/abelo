class Image < ActiveRecord::Base

  validates_presence_of :description, :picture

  belongs_to :product

  file_column :picture, :magick => {
    :versions => { 'thumb' => '50x50', :medium => '320x240' }
  }

end
