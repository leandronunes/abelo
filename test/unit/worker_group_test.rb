require File.dirname(__FILE__) + '/../test_helper'

class WorkerGroupTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @worker_group = create_worker_group
  end

  def test_setup
    assert @organization.valid?
    assert @worker_group.valid?
  end

  def test_absence_of_name
    m = WorkerGroup.create
    !m.valid?

    assert m.errors.invalid?(:name)
  end
  
  def test_presence_of_name
    m = WorkerGroup.create(:name => 'Mass Mail Group')
    m.valid?
    
    assert !m.errors.invalid?(:name)
  end

end
