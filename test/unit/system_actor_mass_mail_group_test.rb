require File.dirname(__FILE__) + '/../test_helper'

class SystemActorMassMailGroupTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @system_actor = create_customer
    @mass_mail_group = create_mass_mail_group
  end

  def test_setup
    assert @organization.valid?
    assert @system_actor.valid?
  end

  def test_absence_of_system_actor
    s = SystemActorMassMailGroup.create
    !s.valid?

    assert s.errors.invalid?(:system_actor_id)
  end

  def test_presence_of_system_actor
    s = SystemActorMassMailGroup.create(:system_actor => @system_actor)
    s.valid?

    assert !s.errors.invalid?(:system_actor_id)
  end

  def test_absence_of_mass_mail_group
    s = SystemActorMassMailGroup.create
    !s.valid?

    assert s.errors.invalid?(:mass_mail_group_id)
  end

  def test_presence_of_mass_mail_group
    s = SystemActorMassMailGroup.create(:mass_mail_group => @mass_mail_group)
    s.valid?

    assert !s.errors.invalid?(:mass_mail_group_id)
  end

  def test_relation_with_system_actor
    s = SystemActorMassMailGroup.create(:system_actor => @system_actor, :mass_mail_group => @mass_mail_group) 

    assert_equal @system_actor, s.system_actor
  end

  def test_relation_with_mass_mail_group
    s = SystemActorMassMailGroup.create(:system_actor => @system_actor, :mass_mail_group => @mass_mail_group) 

    assert_equal @mass_mail_group, s.mass_mail_group
  end
end
