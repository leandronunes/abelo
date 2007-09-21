require File.dirname(__FILE__) + '/../test_helper'

class DisplayConfigurationTest < Test::Unit::TestCase
  fixtures :configurations

  def setup
    @organization = Organization.find(:first)
    @configuration = Configuration.find(:first)
    @other_configuration = Configuration.create(:organization_name => 'Some Name',
                         :product_name => 'Some name', :department_name => 'Some Name',
                          :customer_name => 'Some name', :document_name => 'Some Name', :organization => @organization)
  end

  def test_setup
    assert @configuration.valid?
    assert @other_configuration.valid?
    assert @organization.valid?
  end

  def test_uniqueness_of_field
    DisplayConfiguration.create(:configuration => @configuration, :field => 'name')
    d = DisplayConfiguration.new(:configuration => @configuration, :field => 'name')
    d.valid?
    assert d.errors.invalid?(:field)
  end

  def test_scope_of_field_by_different_organization_configurations
    DisplayConfiguration.create(:configuration => @configuration, :field => 'name')
    d = DisplayConfiguration.new(:configuration => @other_configuration, :field => 'name')
    d.valid?
    assert !d.errors.invalid?(:field)
  end

  def test_scope_of_field_by_differents_display_objects_of_the_same_organization_configuration
    ProductDisplay.create(:configuration => @configuration, :field => 'name')
    d = LedgerDisplay.new(:configuration => @configuration, :field => 'name')
    d.valid?
    assert !d.errors.invalid?(:field)
  end

  def test_title
    assert_raise(RuntimeError){ DisplayConfiguration.title}
  end

end
