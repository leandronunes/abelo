require File.dirname(__FILE__) + '/../test_helper'

class ImageTest < Test::Unit::TestCase
  fixtures :images, :products

  def test_mandatory_fields
    img = Image.new
    assert(!img.save)

    img.description = 'a image'
    assert(!img.save)

    stream = StringIO.new(File.read('public/images/rails.png'))
    def stream.original_filename
      'rails.png'
    end
    def stream.content_type
      'image/png'
    end

    img.product = Product.find(1)

    img.picture = stream
    assert(img.save)

    assert_equal img[:picture], 'rails.png'
    assert_equal "#{img.id}/rails.png", img.picture_relative_path

  end
end
