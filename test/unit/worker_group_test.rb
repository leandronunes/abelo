require File.dirname(__FILE__) + '/../test_helper'

class WorkerGroupTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @worker_group = create_worker_group
    @worker = create_worker
  end

  def test_setup
    assert @organization.valid?
    assert @worker_group.valid?
    assert @worker.valid?
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

  def test_absence_of_organization
    m = WorkerGroup.create(:name => 'Some mass mail group for testing')
    !m.valid?

    assert !m.errors.invalid?(:organization)
  end

  def test_relation_with_organization
    m = WorkerGroup.create(:name => 'Some mass mail group for testing', :organization => @organization)
    assert_equal @organization, m.organization
  end

  def test_relation_with_system_actors    
    SystemActorMassMailGroup.create(:mass_mail_group => @worker_group, :system_actor => @worker)
    
    assert @worker_group.system_actors.include?(@worker)
  end

  def test_adding_a_worker
    worker = create_worker(:cpf => '12187389014')
    count = @worker_group.system_actors.length

    @worker_group.system_actors << worker
    assert_equal count + 1, @worker_group.system_actors.length
  end

  def test_worker_only_once_in_a_group
    count = @worker_group.system_actors.length

    @worker_group.system_actors << @worker
    @worker_group.system_actors << @worker
    assert_equal count, @worker_group.system_actors.length
  end
end
