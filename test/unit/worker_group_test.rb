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
    g = WorkerGroup.create
    !g.valid?

    assert g.errors.invalid?(:name)
  end
  
  def test_presence_of_name
    g = WorkerGroup.create(:name => 'Mass Mail Group')
    g.valid?
    
    assert !g.errors.invalid?(:name)
  end

  def test_absence_of_organization
    g = WorkerGroup.create(:name => 'Some mass mail group for testing')
    !g.valid?

    assert !g.errors.invalid?(:organization)
  end

  def test_uniqueness_of_name
    g_1 = create_worker_group(:name => 'Mass Mail Group')
    g_1.valid?

    assert_raise ActiveRecord::RecordInvalid do
      g_2 = create_worker_group(:name => 'Mass Mail Group')
    end

  end 

  def test_relation_with_organization
    g = create_worker_group(:name => 'Some mass mail group for testing')
    assert_equal @organization, g.organization
  end

  def test_relation_with_system_actors    
    SystemActorMassMailGroup.create(:mass_mail_group => @worker_group, :system_actor => @worker)
    
    assert @worker_group.system_actors.include?(@worker)
  end

  def test_adding_a_worker
    @worker_group.system_actors << @worker
    assert @worker_group.system_actors.include?(@worker)
  end

  def test_worker_only_once_in_a_group
    @worker_group.system_actors << @worker
    count = @worker_group.system_actors.length

    assert_raise ActiveRecord::RecordInvalid do
       @worker_group.system_actors << @worker
    end
    assert_equal count, @worker_group.system_actors.length
  end

  def test_removing_a_worker
    @worker_group.system_actors << @worker

    @worker_group.system_actors.delete @worker

    assert !@worker_group.system_actors.include?(@worker)
  end

  def test_full_text_search
    mass_mail_group_1 = create_worker_group(:name => 'Group test')
    mass_mail_group_2 = create_worker_group(:name => 'Group test2')
    mass_mail_groups = WorkerGroup.full_text_search('test2')
    assert_equal 1, mass_mail_groups.length
    assert mass_mail_groups.include?(mass_mail_group_2)
  end
end
