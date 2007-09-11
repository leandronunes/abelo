require File.dirname(__FILE__) + '/../test_helper'

class ProfileTest < Test::Unit::TestCase
  fixtures :profiles, :people, :organizations

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :identifier => 'org')
    @user = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>false, "remember_token"=>nil, "login"=>"new_user", "email"=>"new_user@example.com", "created_at"=>"2007-07-14 18:03:29")
    @user_admin = User.create!("salt"=>"7e3041ebc2fc05a40c60028e2c4901a81035d3cd", "updated_at"=>nil, "crypted_password"=>"00742970dc9e6319f8019fd54864d3ea740f04b1", "type"=>"User", "remember_token_expires_at"=>nil, "id"=>"1", "administrator"=>true, "remember_token"=>nil, "login"=>"admin_test", "email"=>"admin_test@example.com", "created_at"=>"2007-07-14 18:03:29")
  end

  def test_mandatory_field_organization_id_when_the_user_is_not_admin
    profile = Profile.create(:user => @user, :permissions => [])
    assert profile.errors.invalid?(:organization_id)
  end

  def test_presence_of_organization_id_when_the_user_is_admin
    profile = Profile.create(:user => @user_admin, :permissions => [], :organization_id => @org.id)
    assert profile.errors.invalid?(:organization_id)
  end

  def test_mandatory_field_user
    profile = Profile.create(:organization_id => @org.id, :permissions => [])
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


end
