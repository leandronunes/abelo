require File.dirname(__FILE__) + '/../test_helper'

class MassMailGroupTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @mass_mail_group = create_mass_mail_group
  end

  def test_setup
    assert @organization.valid?
    assert @mass_mail_group.valid?
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

end
