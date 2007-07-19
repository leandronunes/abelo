class Image < ActiveRecord::Base

  validates_presence_of :description, :picture

  belongs_to :product

  file_column :picture, :store_dir => '/home/keilla/abelo/public/image/test_images/', :magick => {
    :versions => { :thumb => '120x120', :medium => '320x240' }
  }

end
