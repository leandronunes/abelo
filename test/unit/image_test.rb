require File.dirname(__FILE__) + '/../test_helper'

class ImageTest < Test::Unit::TestCase
  fixtures :images, :products

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
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
    assert_equal "#{img.id}/rails.png", img.picture_relative_path
  end

  def test_mandatory_field_picture
    img = Image.new
    img.description = 'Image for testing'
    img.save
    assert img.errors.invalid?(:picture)
  end

  def test_relation_with_product
    img = Image.new
    product = Product.create(:name => 'Image of product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id) 
    img.product = product
    assert_equal product, img.product
  end

end
