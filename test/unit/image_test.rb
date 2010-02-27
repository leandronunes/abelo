require File.dirname(__FILE__) + '/../test_helper'

class ImageTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @product_category = create_product_category
    @unit = create_unit
  end

#TODO Uncoment this test
#  def test_mandatory_field_description
#    img = Image.new(image_params(:description => nil))
#    img.valid? 
#    
#    assert img.errors.invalid?(:description)
#  end

  def test_relation_with_product
    img = Image.new
    product = create_product
    img.product = product
    assert_equal product, img.product
  end

end
