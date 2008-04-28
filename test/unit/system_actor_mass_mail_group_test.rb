require File.dirname(__FILE__) + '/../test_helper'

class SystemActorMassMailGroupTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @customer_group = create_customer_group
    @worker_group = create_worker_group
    @customer = create_customer
    @worker = create_worker
  end

  def test_setup
    assert @organization.valid?
    assert @customer_group.valid?
    assert @worker_group.valid?
    assert @customer.valid?
    assert @worker.valid?
  end

  def test_absence_of_system_actor
    s = SystemActorMassMailGroup.create
    !s.valid?

    assert s.errors.invalid?(:system_actor_id)
  end

  def test_presence_of_system_actor_customer
    s = SystemActorMassMailGroup.create(:system_actor => @customer)
    s.valid?

    assert !s.errors.invalid?(:system_actor_id)
  end

  def test_presence_of_system_actor_worker
    s = SystemActorMassMailGroup.create(:system_actor => @worker)
    s.valid?

    assert !s.errors.invalid?(:system_actor_id)
  end

  def test_absence_of_mass_mail_group
    s = SystemActorMassMailGroup.create
    !s.valid?

    assert s.errors.invalid?(:mass_mail_group_id)
  end

  def test_presence_of_worker_group
    s = SystemActorMassMailGroup.create(:mass_mail_group => @worker_group)
    s.valid?

    assert !s.errors.invalid?(:mass_mail_group_id)
  end

  def test_presence_of_customer_group
    s = SystemActorMassMailGroup.create(:mass_mail_group => @worker_group)
    s.valid?

    assert !s.errors.invalid?(:mass_mail_group_id)
  end

  def test_relation_with_system_actor_worker
    s = SystemActorMassMailGroup.create(:system_actor => @worker, :mass_mail_group => @mass_mail_group) 

    assert_equal @worker, s.system_actor
  end

  def test_relation_with_system_actor_customer
    s = SystemActorMassMailGroup.create(:system_actor => @customer, :mass_mail_group => @mass_mail_group) 

    assert_equal @customer, s.system_actor
  end

  def test_presence_of_system_actor_not_customer_or_worker
    supplier = create_supplier
    s = SystemActorMassMailGroup.create(:system_actor => supplier)
    !s.valid?

    assert s.errors.invalid?(:system_actor)
  end

  def test_relation_with_worker_group
    s = SystemActorMassMailGroup.create(:system_actor => @worker, :mass_mail_group => @worker_group) 
    s.valid?

    assert_equal @worker_group, s.mass_mail_group
  end

  def test_relation_with_customer_group
    s = SystemActorMassMailGroup.create(:system_actor => @customer, :mass_mail_group => @customer_group) 
    s.valid?

    assert_equal @customer_group, s.mass_mail_group
  end

  def test_if_worker_can_be_in_a_customer_group
    s = SystemActorMassMailGroup.create(:system_actor => @worker, :mass_mail_group => @customer_group)
    !s.valid?
    assert_equal 1, s.errors.length

    s.mass_mail_group = @worker_group
    s.valid?
    assert_equal 0, s.errors.length  
  end

  def test_if_customer_can_be_in_a_worker_group
    s = SystemActorMassMailGroup.create(:system_actor => @customer, :mass_mail_group => @worker_group)
    !s.valid?
    assert_equal 1, s.errors.length

    s.mass_mail_group = @customer_group
    s.valid?
    assert_equal 0, s.errors.length
  end

end
