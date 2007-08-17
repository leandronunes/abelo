require File.dirname(__FILE__) + '/../test_helper'

class ConfigurationTest < Test::Unit::TestCase
  fixtures :configurations, :organizations

  def test_full_product_is_array_when_instanciate
    c = Configuration.new 
    assert_kind_of Array, c.full_product
  end

  def test_lite_product_is_array_when_instanciate
    c = Configuration.new 
    assert_kind_of Array, c.lite_product
  end

  def test_full_product_is_array_after_load
    o = Organization.find(:first)
    c = Configuration.new
    c.organization = o
    c.full_product = ["size", "name"]
    assert c.save
    c2 = Configuration.find(c.id) 
    assert_kind_of Array, c2.full_product
  end

  def test_lite_product_is_array_after_load
    c = Configuration.new 
    assert_kind_of Array, c.lite_product
  end

  def test_lite_product_is_array_after_load
    o = Organization.find(:first)
    c = Configuration.new
    c.lite_product = ["size", "name"]
    c.organization = o
    assert c.save
    c2 = Configuration.find(c.id) 
    assert_kind_of Array, c2.lite_product
  end

end
