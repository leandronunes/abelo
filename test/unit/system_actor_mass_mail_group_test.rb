require File.dirname(__FILE__) + '/../test_helper'

class SystemActorMassMailGroupTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @worker_category = create_worker_category
    @customer_category = create_customer_category
    @supplier_category = create_supplier_category
  end

  def test_absence_of_system_actor
    s = SystemActorMassMailGroup.create
    !s.valid?

    assert s.errors.invalid?(:system_actor_id)
  end

  def test_presence_of_system_actor_customer
    customer = create_customer
    s = SystemActorMassMailGroup.create(:system_actor => customer)
    s.valid?

    assert !s.errors.invalid?(:system_actor_id)
  end

  def test_presence_of_system_actor_worker
    s = SystemActorMassMailGroup.new
    s.valid?
    assert s.errors.invalid?(:system_actor_id)

    customer = create_customer
    s = SystemActorMassMailGroup.new(:system_actor_id => customer.id)
    s.valid?
    assert !s.errors.invalid?(:system_actor_id)
  end

  def test_absence_of_mass_mail_group
    s = SystemActorMassMailGroup.create
    !s.valid?

    assert s.errors.invalid?(:mass_mail_group_id)
  end

  def test_presence_of_worker_group
    worker_group = create_worker_group
    s = SystemActorMassMailGroup.create(:mass_mail_group => worker_group)
    s.valid?

    assert !s.errors.invalid?(:mass_mail_group_id)
  end

  def test_presence_of_customer_group
    customer_group = create_customer_group
    s = SystemActorMassMailGroup.create(:mass_mail_group => customer_group)
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
    Supplier.destroy_all
    supplier = create_supplier
    s = SystemActorMassMailGroup.create(:system_actor => supplier)
    s.valid?

    assert s.errors.invalid?(:system_actor_id)
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
    worker = create_worker
    customer_group = create_customer_group
    s = SystemActorMassMailGroup.create(:system_actor => worker, :mass_mail_group => customer_group)
    s.valid?
    assert_equal 1, s.errors.length

    worker_group = create_worker_group
    s.mass_mail_group = worker_group
    s.valid?
    assert_equal 0, s.errors.length  
  end

  def test_if_customer_can_be_in_a_worker_group
    customer = create_customer
    worker_group = create_worker_group
    s = SystemActorMassMailGroup.create(:system_actor => customer, :mass_mail_group => worker_group)
    !s.valid?
    assert_equal 1, s.errors.length
    
    customer_group = create_customer_group
    s.mass_mail_group = customer_group
    s.valid?
    assert_equal 0, s.errors.length
  end

  def test_if_relation_is_deleted_when_a_worker_is_deleted_from_a_group
    worker_group = create_worker_group
    worker = create_worker
    worker_group.system_actors << worker  
    count = SystemActorMassMailGroup.count

    worker_group.system_actors.delete worker
    assert_equal count - 1, SystemActorMassMailGroup.count
  end

  def test_if_relation_is_deleted_when_a_customer_is_deleted_from_a_group
    customer_group = create_customer_group
    customer = create_customer
    customer_group.system_actors << customer  
    count = SystemActorMassMailGroup.count

    customer_group.system_actors.delete customer
    assert_equal count - 1, SystemActorMassMailGroup.count
  end

  def test_if_relation_is_deleted_when_a_group_is_deleted_from_a_worker
    worker = create_worker
    worker_group = create_worker_group
    worker.mass_mail_groups << worker_group  
    count = SystemActorMassMailGroup.count

    worker.mass_mail_groups.delete worker_group
    assert_equal count - 1, SystemActorMassMailGroup.count
  end

  def test_if_relation_is_deleted_when_a_group_is_deleted_from_a_customer
    customer = create_customer
    customer_group = create_customer_group
    customer.mass_mail_groups << customer_group  
    count = SystemActorMassMailGroup.count

    customer.mass_mail_groups.delete customer_group
    assert_equal count - 1, SystemActorMassMailGroup.count
  end

  def test_if_relations_are_deleted_when_a_group_is_deleted
    worker_group = create_worker_group
    worker = create_worker
    worker_group.system_actors << worker
    count = SystemActorMassMailGroup.count

    worker_group.destroy

    assert_equal count - 1, SystemActorMassMailGroup.count
  end
end
