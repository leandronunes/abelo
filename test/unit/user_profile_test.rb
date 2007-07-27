require File.dirname(__FILE__) + '/../test_helper'

class ProfileTest < Test::Unit::TestCase
  fixtures :profiles, :people, :organizations

  # Replace this with your real tests.
  def test_mandatory_fields
    count = Profile.count

    profile = Profile.new
    assert(!profile.save)

    profile.user = User.find(1)
    assert(!profile.save)

    profile.organization = Organization.find(1)
    assert(!profile.save)

    profile.permissions = []
    assert(profile.save)

    assert_equal count + 1, Profile.count
  end

  def test_relationships_and_stuff
    profile = Profile.find(:first)
    assert_not_nil profile.user
    assert_kind_of User, profile.user
    assert_not_nil profile.organization
    assert_kind_of Organization, profile.organization
    assert_not_nil profile.permissions
    assert_kind_of Array, profile.permissions
  end

  def test_read_only
    profile = Profile.find(2)
    assert_equal Profile::TEMPLATES['read_only'], profile.permissions
  end

  def test_allowed_actions_in_organization
    profile1 = Profile.find(1)
    assert(profile1.allows?(:organization_nickname => 'one', :controller => 'main', :action => 'edit'))

    profile2 = Profile.find(2)
    assert(!profile2.allows?(:organization_nickname => 'one', :controller => 'main', :action =>  'edit'))
  end

  def test_allowed_actions_per_user
    user1 = people(:quentin)
    assert(user1.allowed_to?(:organization_nickname => 'one', :controller => 'main', :action => 'edit'))

    user2 = people(:aaron)
    assert(!user2.allowed_to?(:organization_nickname => 'one', :controller => 'main', :action => 'edit'))
  end

  def test_assign_template
    profile = Profile.new
    profile.user = people(:aaron)
    profile.organization = organizations(:organization_with_department)
    profile.template = 'full_access'
    assert(profile.save)
    profile.template = 'read_only'
    assert(profile.save)
    profile.template = 'sales_person'
    assert(profile.save)
    assert_raise(ArgumentError) do
      profile.template = 'asdgsagdkjasgdajk'
    end
  end

  def test_read_template
    profile = Profile.find(1)
    assert_equal 'full_access', profile.template
    profile = Profile.find(2)
    assert_equal 'read_only', profile.template
    profile = Profile.find(3)
    assert_equal 'full_access', profile.template
    profile = Profile.find(4)
    assert_equal 'sales_person', profile.template
  end

end
