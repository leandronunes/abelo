require File.dirname(__FILE__) + '/../test_helper'

class AddressTest < Test::Unit::TestCase

  def setup
    @country = BSC::Country.create(:name => 'Some Country')
    @state = BSC::State.create(:name => 'Some State', :country => @country, :code => 'SS')
    @city = BSC::City.create(:state => @state, :name => 'Some City', :zip_code => '40000')
  end

  def test_setup
    assert @country.valid?
    assert @state.valid?
    assert @city.valid?
  end

  def test_precense_of_country
    a = Address.new
    a.valid?
    assert a.errors.invalid?(:country_id)
    a.country = @country
    a.valid?
    assert !a.errors.invalid?(:country_id)
  end

  def test_precense_of_state
    a = Address.new
    a.valid?
    assert a.errors.invalid?(:state_id)
    a.state = @state
    a.valid?
    assert !a.errors.invalid?(:state_id)
  end

  def test_precense_of_city
    a = Address.new
    a.valid?
    assert a.errors.invalid?(:city_id)
    a.city = @city
    a.valid?
    assert !a.errors.invalid?(:city_id)
  end


end
