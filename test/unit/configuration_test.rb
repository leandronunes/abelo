require File.dirname(__FILE__) + '/../test_helper'

class ConfigurationTest < Test::Unit::TestCase
  fixtures :configurations, :organizations

  def test_full_product_is_array_when_instanciate
    c = Configuration.new 
    assert_kind_of c.full_product, Array
  end

  def test_full_product_is_array_after_load
    o = Organization.find(:first)
    c = Configuration.new
    c.owner = o
    c.Organization = o
    c.full_product = ["size", "name"]
    assert c.save
    c2 = Configuration.find(c.id) 
    assert_kind_of c2.full_product, Array
  end

  def test_lite_product_is_array_after_load
    c = Configuration.new 
    assert_kind_of c.lite_product, Array
  end

  def test_lite_product_is_array_after_load
    o = Organization.find(:first)
    c = Configuration.new
    c.owner = o
    c.Organization = o
    c.lite_product = ["size", "name"]
    assert c.save
    c2 = Configuration.find(c.id) 
    assert_kind_of c2.lite_product, Array
  end

end
