require File.dirname(__FILE__) + '/../test_helper'

class MassMailGroupTest < Test::Unit::TestCase

  def setup
    Worker.delete_all
    @organization = create_organization
  end

  def test_setup
    assert @organization.valid?
  end

  def test_absence_of_name
    m = MassMailGroup.create
    !m.valid?

    assert m.errors.invalid?(:name)
  end
  
  def test_presence_of_name
    m = MassMailGroup.create(:name => 'Mass Mail Group')
    m.valid?
    
    assert !m.errors.invalid?(:name)
  end

  def test_absence_of_organization
    m = MassMailGroup.create(:name => 'Some mass mail group for testing')
    !m.valid?

    assert !m.errors.invalid?(:organization)
  end

end
