class Image < ActiveRecord::Base

  belongs_to :product
#  validates_presence_of :description # FIXME Leandro remove this option, :picture
#  #FIXME See why the validation doesn't works with description.

  has_attachment :content_type => :image,
                 :storage      => :file_system,
                 :path_prefix => 'public/abelo_images',
                 :thumbnails   => { 'thumb' => '120x120', :medium => '320x240' }


end
