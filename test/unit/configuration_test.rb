require File.dirname(__FILE__) + '/../test_helper'

class ConfigurationTest < Test::Unit::TestCase
 
  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_relation_with_product_category_displays
    configuration = @org.configuration
    prod_cat = ProductCategoryDisplay.new
    configuration.product_category_displays.concat(prod_cat) 
    assert configuration.product_category_displays.include?(prod_cat)
  end

  def test_product_category_display_fields=
  end

  def test_product_category_display_fields_in_list=
  end

  def test_product_category_display_fields
  end

  def test_product_category_display_fields_in_list
  end

  def test_product_category_display
  end

  def test_product_category_display_in_list
  end

end
