require File.dirname(__FILE__) + '/../test_helper'

class UnitMeasureMeasureTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
  end

  def test_setup
    assert @organization.valid?
  end

  def test_presence_of_name
    u = UnitMeasure.new
    u.valid?
    assert u.errors.invalid?(:name)
    
    u.name = 'some name'
    u.valid?
    assert !u.errors.invalid?(:name)
  end

  def test_uniqueness_of_name_on_organization_scope
   UnitMeasure.destroy_all
   o1 = create_organization(:identifier => 'someid', :name => 'some name' )
   create_unit(:name => 'some', :abbreviation => 'so', :organization => o1)
   u = UnitMeasure.new
   u.name= 'some'
   u.organization = o1
   u.valid?
   assert u.errors.invalid?(:name)

   o2 = create_organization(:identifier => 'another_someid', :name => 'Another name')
   u = UnitMeasure.new
   u.name= 'some'
   u.organization = o2
   u.valid?
   assert !u.errors.invalid?(:name)
  end 


  def test_presence_of_abbreviation
    u = UnitMeasure.new
    u.valid?
    assert u.errors.invalid?(:abbreviation)
    
    u.abbreviation = 'so'
    u.valid?
    assert !u.errors.invalid?(:abbreviation)
  end

  def test_limit_of_abbreviation
    u = UnitMeasure.new
    u.abbreviation= 'so'
    u.valid?
    assert !u.errors.invalid?(:abbreviation)
    u.abbreviation = 'some'
    u.valid?   
    assert u.errors.invalid?(:abbreviation)
  end 

  def test_uniqueness_of_abbreviation_on_organization_scope
   UnitMeasure.destroy_all
   o1 = create_organization(:identifier => 'someid', :name => 'some abbreviation' )
   create_unit(:abbreviation => 'some', :abbreviation => 'so', :organization => o1)
   u = UnitMeasure.new
   u.abbreviation= 'so'
   u.organization = o1
   u.valid?
   assert u.errors.invalid?(:abbreviation)

   o2 = create_organization(:identifier => 'another_someid', :name => 'Another abbreviation')
   u = UnitMeasure.new
   u.abbreviation= 'so'
   u.organization = o2
   u.valid?
   assert !u.errors.invalid?(:abbreviation)
  end 

  def test_full_text_search
    UnitMeasure.destroy_all
    unit1 = create_unit(:name => 'some unit', :abbreviation => 'su')
    unit2 = create_unit(:name => 'another unit', :abbreviation => 'au')
    unit3 = create_unit(:name => 'unit three', :abbreviation => 'ut')

    units = UnitMeasure.full_text_search('another*')
    assert_equal 1, units.length
    assert units.include?(unit2)
  end 


end


