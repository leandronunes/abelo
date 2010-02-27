require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase

  def setup
    @organization = create_organization(:identifier => 'one')
    @user = create_user
  end

  def test_should_create_user
    assert_difference 'User.count' do
      user = create_user(:login => 'another user')
      assert !user.new_record?, "#{user.errors.full_messages.to_sentence}"
    end
  end

  def test_should_require_login
    assert_no_difference 'User.count' do
      u = User.new(user_params(:login => nil))
      u.valid?
      assert u.errors.on(:login)
    end
  end

  def test_should_require_password
    assert_no_difference 'User.count' do
      u = User.new(user_params(:password => nil))
      u.valid?
      assert u.errors.on(:password)
    end
  end

  def test_should_require_password_confirmation
    assert_no_difference 'User.count' do
      u = User.new(user_params(:password_confirmation => nil))
      u.valid?
      assert u.errors.on(:password_confirmation)
    end
  end

  def test_should_require_email
    assert_no_difference 'User.count' do
      u = User.new(user_params(:email => nil))
      u.valid?
      assert u.errors.on(:email)
    end
  end

  def test_should_reset_password
    @user.update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal @user, User.authenticate(@user.login, 'new password')
  end

  def test_should_not_rehash_password
    user = create_user(:login => "test", :password => '123456', :password_confirmation => '123456')
    user.update_attributes(:login => 'quentin2')
    assert_equal user, User.authenticate('quentin2', '123456')
  end

  def test_should_authenticate_user
    assert_equal @user, User.authenticate(@user.login, 'test')
  end

  def test_should_set_remember_token
    @user.remember_me
    assert_not_nil @user.remember_token
    assert_not_nil @user.remember_token_expires_at
  end

  def test_should_unset_remember_token
    @user.remember_me
    assert_not_nil @user.remember_token
    @user.forget_me
    assert_nil @user.remember_token
  end

  def test_should_have_profiles
    assert_not_nil @user.profiles
    assert_kind_of Array, @user.profiles
    @user.profiles.each { |profile|
      assert_kind_of Profile, profile
    }
  end

  def test_should_have_organizations
    user = @user
    assert_not_nil user.organizations
    assert_kind_of Array, user.organizations
    user.organizations.each { |o|
      assert_kind_of Organization, o
    }
  end

end
