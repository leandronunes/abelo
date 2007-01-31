require File.dirname(__FILE__) + '/../test_helper'

class UserProfileTest < Test::Unit::TestCase
  fixtures :user_profiles, :people, :organizations

  # Replace this with your real tests.
  def test_mandatory_fields
    count = UserProfile.count

    profile = UserProfile.new
    assert(!profile.save)

    profile.user = User.find(1)
    assert(!profile.save)

    profile.organization = Organization.find(1)
    assert(!profile.save)

    profile.permissions = []
    assert(profile.save)

    assert_equal count + 1, UserProfile.count
  end

  def test_relationships_and_stuff
    profile = UserProfile.find(:first)
    assert_not_nil profile.user
    assert_kind_of User, profile.user
    assert_not_nil profile.organization
    assert_kind_of Organization, profile.organization
    assert_not_nil profile.permissions
    assert_kind_of Array, profile.permissions
  end

  def test_read_only
    profile = UserProfile.find(2)
    assert_equal UserProfile::TEMPLATES['read_only'], profile.permissions
  end

  def test_allowed_actions_in_organization
    profile1 = UserProfile.find(1)
    assert(profile1.allows?(:organization_nickname => 'one', :controller => 'main', :action => 'edit'))

    profile2 = UserProfile.find(2)
    assert(!profile2.allows?(:organization_nickname => 'one', :controller => 'main', :action =>  'edit'))
  end

  def test_allowed_actions_per_user
    user1 = people(:quentin)
    assert(user1.allowed_to?(:organization_nickname => 'one', :controller => 'main', :action => 'edit'))

    user2 = people(:aaron)
    assert(!user2.allowed_to?(:organization_nickname => 'one', :controller => 'main', :action => 'edit'))
  end

  def test_assign_template
    profile = UserProfile.new
    profile.user = people(:aaron)
    profile.organization = organizations(:one)
    profile.template = 'full_access'
    assert(profile.save)
    profile.template = 'read_only'
    assert(profile.save)
    assert_raise(ArgumentError) do
      profile.template = 'asdgsagdkjasgdajk'
    end
  end

  def test_read_template
    profile = UserProfile.find(1)
    assert_equal 'full_access', profile.template
    profile = UserProfile.find(2)
    assert_equal 'read_only', profile.template
    profile = UserProfile.find(3)
    assert_equal 'full_access', profile.template
  end

end
