require File.dirname(__FILE__) + '/../test_helper'

class PeriodicityTest < Test::Unit::TestCase

  fixtures :periodicities, :organizations

  def setup
    @organization = create_organization
    @another_organization = create_organization(:identifier => 'another_id', :cnpj => '11.743.627/0001-59', :name => 'Another name')
  end

  def test_setup
    assert @organization.valid?
  end

  def test_validates_presence_of_organization
    p  = Periodicity.new()
    p.valid?
    assert p.errors.invalid?(:organization_id)
    p.organization = @organization
    p.valid?
    assert !p.errors.invalid?(:organization_id)
  end


  def test_validates_presence_of_number_of_days
    p  = Periodicity.new()
    p.valid?
    assert p.errors.invalid?(:number_of_days)
    p.number_of_days = 20
    p.valid?
    assert !p.errors.invalid?(:number_of_days)
  end

  def test_validates_presence_of_name
    p  = Periodicity.new()
    p.valid?
    assert p.errors.invalid?(:name)
    p.name = 'Some name'
    p.valid?
    assert !p.errors.invalid?(:name)
  end

  def test_validates_uniqueness_of_name_on_organization_scope
    p1 = Periodicity.create!(:name => 'name', :number_of_days => 20, :organization => @organization)
    p = Periodicity.new
    p.valid?
    assert p.errors.invalid?(:name)
    p.organization = @organization
    p.name = 'name'
    p.valid?
    assert p.errors.invalid?(:name)
    p.name = 'Another name'
    p.valid?
    assert !p.errors.invalid?(:name)
  end

  def test_validates_name_on_differents_organizations_scope
    p1 = Periodicity.create!(:name => 'name', :number_of_days => 20, :organization => @organization)
    p2 = Periodicity.new(:name => 'name', :number_of_days => 20, :organization => @another_organization)
    assert p2.save
  end

  def test_numericality_of_number_of_days
    p = Periodicity.new()
    p.number_of_days = 20
    p.valid?
    assert !p.errors.invalid?(:number_of_days)
    p.number_of_days = 'a'
    p.valid?
    assert p.errors.invalid?(:number_of_days)
  end

  def test_number_of_days_is_integer
    p = Periodicity.new()
    p.number_of_days = 20
    p.valid?
    assert !p.errors.invalid?(:number_of_days)
    p.number_of_days = 2.3
    p.valid?
    assert p.errors.invalid?(:number_of_days)
  end

end
