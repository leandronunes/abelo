require File.dirname(__FILE__) + '/../test_helper'

class ConfigurationTest < Test::Unit::TestCase
 
  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_relation_with_product_category_displays
    configuration = @org.configuration
    id = configuration.id
    configuration = Configuration.find(id)
    prod_cat = ProductCategoryDisplay.new
    prod_cat.configuration = configuration
    assert prod_cat.save
    assert configuration.product_category_displays.include?(prod_cat)
  end

  def test_product_category_display_fields=
    configuration = @org.configuration 
    configuration.product_category_display_fields = ["name", "parent"]
    assert_equal ["name", "parent"], configuration.product_category_display_fields
  end

  def test_product_category_display_fields_in_list=
    configuration = @org.configuration
    configuration.product_category_display_fields = ['name', 'parent']
    configuration.product_category_display_fields_in_list = ['name']
    assert_equal ['name'], configuration.product_category_display_fields_in_list    
  end

  def test_product_category_display_fields
    configuration = @org.configuration 
    configuration.product_category_display_fields = ["name", "parent"]
    assert !configuration.product_category_display_fields.empty?
  end

  def test_product_category_display_fields_in_list
    configuration = @org.configuration
    configuration.product_category_display_fields = ['name', 'parent']
    configuration.product_category_display_fields_in_list = ['name']
    assert !configuration.product_category_display_fields_in_list.empty?
  end

  def test_product_category_display
    configuration = @org.configuration
    assert_equal configuration.product_category_displays, configuration.product_category_display
  end

  def test_product_category_display_in_list
    configuration = @org.configuration
    assert_equal configuration.product_category_displays, configuration.product_category_display_in_list
  end

end
