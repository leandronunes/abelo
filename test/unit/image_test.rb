require File.dirname(__FILE__) + '/../test_helper'

class ImageTest < Test::Unit::TestCase

  fixtures :images, :products, :organizations

  def setup
    @organization = create_organization
  end

  def test_mandatory_field_description
    img = Image.new
    
    stream = StringIO.new(File.read('public/images/rails.png'))
    def stream.original_filename
      'rails.png'
    end
    def stream.content_type
      'image/png'
    end

    img.picture = stream
    img.save
    
    assert img.errors.invalid?(:description)
    assert_equal img[:picture], 'rails.png'
#TODO put this assertion to works
#    assert_equal "#{img.id}/rails.png", img.picture_relative_path
  end

  def test_mandatory_field_picture
    img = Image.new
    img.description = 'Image for testing'
    img.save
    assert img.errors.invalid?(:picture)
  end

  def test_relation_with_product
    img = Image.new
    product = create_product
    img.product = product
    assert_equal product, img.product
  end

end
