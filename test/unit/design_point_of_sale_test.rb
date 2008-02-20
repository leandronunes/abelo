require File.dirname(__FILE__) + '/../test_helper'

class DesignPointOfSaleTest < Test::Unit::TestCase

  fixtures :organizations

  def setup
    @organization = create_organization
  end

  def test_setup
    assert @organization.valid?    
  end

  def test_design_data_return_hash_when_empty
    design = DesignPointOfSale.new(@organization)
    assert_kind_of Hash, design.design_data
  end

  def test_design_data_return_hash
    design = DesignPointOfSale.new(@organization)
    design.design_data =  {:template => 'some'}
    assert_kind_of Hash, design.design_data
  end

  def test_template 
    design = DesignPointOfSale.new(@organization)
    some_template  = 'some'
    design.design_data =  {:template => some_template}
    assert_equal some_template, design.template
  end

  def test_template_when_no_template_is_defined
    design = DesignPointOfSale.new(@organization)
    assert_equal 'default', design.template
  end

  def test_theme
    design = DesignPointOfSale.new(@organization)
    some_theme  = 'some'
    design.design_data =  {:theme => some_theme}
    assert_equal some_theme, design.theme
  end

  def test_theme_when_no_theme_is_defined
    design = DesignPointOfSale.new(@organization)
    assert_equal 'default', design.theme
  end

  def test_icon_theme 
    design = DesignPointOfSale.new(@organization)
    some_icon_theme  = 'some'
    design.design_data =  {:icon_theme => some_icon_theme}
    assert_equal some_icon_theme, design.icon_theme
  end

  def test_icon_theme_when_no_icon_theme_is_defined
    design = DesignPointOfSale.new(@organization)
    assert_equal 'default', design.icon_theme
  end

end
