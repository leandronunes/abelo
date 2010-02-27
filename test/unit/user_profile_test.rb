require File.dirname(__FILE__) + '/../test_helper'

class ProfileTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @user = create_user(:login => 'new_user')
    @user_admin = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>true, "remember_token"=>nil, "login"=>"admin_test", "email"=>"admin_test@example.com", "created_at"=>"2007-07-14 18:03:29")
  end

  def test_mandatory_field_organization_id_when_the_user_is_not_admin
    profile = Profile.create(:user => @user, :permissions => [])
    assert profile.errors.invalid?(:organization_id)
  end

  def test_presence_of_organization_id_when_the_user_is_admin
    profile = Profile.create(:user => @user_admin, :permissions => [], :organization_id => @organization.id)
    assert profile.errors.invalid?(:organization_id)
  end

  def test_mandatory_field_user
    profile = Profile.create(:organization_id => @organization.id, :permissions => [])
    assert profile.errors.invalid?(:user_id)
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

  def test_allowed_actions_per_user
    user1 = @user
    assert(user1.allowed_to?(:organization_nickname => @organization.name, :controller => 'organization', :action => 'edit'))

    user2 = create_user
    user2.profiles = []
    assert(!user2.allowed_to?(:organization_nickname => @organization.name, :controller => 'organization', :action => 'edit'))
  end

  def test_assign_template
    profile = Profile.new
    profile.user = @user
    profile.organization = @organization
    profile.template = 'sales_person'
    assert(profile.save)
    assert_raise(ArgumentError) do
      profile.template = 'asdgsagdkjasgdajk'
    end
  end


end
