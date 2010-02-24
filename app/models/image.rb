class Image < ActiveRecord::Base

  has_attachment :content_type => :image,
                 :storage      => :file_system,
                 :path_prefix => 'public/abelo_images',
                 :thumbnails   => { 'thumb' => '120x120', :medium => '320x240' }

  validates_as_attachment

  belongs_to :product
#  validates_presence_of :description #TODO See way s not working

end
