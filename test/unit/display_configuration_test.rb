require File.dirname(__FILE__) + '/../test_helper'

class DisplayConfigurationTest < Test::Unit::TestCase
  fixtures :display_configurations, :configurations

  def setup
    @configuration = Configuration.find(:first)
  end

  def test_setup
    assert @configuration.valid?
  end

  def test_presence_of_configuration
    d = DisplayConfiguration.new
    d.valid?
    assert d.errors.invalid?(:configuration_id)
    d.configuration = @configuration
    d.valid?
    assert !d.errors.invalid?(:configuration_id) 
  end
end
