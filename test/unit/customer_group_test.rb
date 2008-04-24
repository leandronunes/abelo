require File.dirname(__FILE__) + '/../test_helper'

class CustomerGroupTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @customer_group = create_customer_group
  end

  def test_setup
    assert @organization.valid?
    assert @customer_group.valid?
  end

  def test_absence_of_name
    m = MassMailGroup.create
    !m.valid?

    assert m.errors.invalid?(:name)
  end
  
  def test_presence_of_name
    m = CustomerGroup.create(:name => 'Mass Mail Group')
    m.valid?
    
    assert !m.errors.invalid?(:name)
  end

end
