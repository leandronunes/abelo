require File.dirname(__FILE__) + '/../test_helper'

class UserTest < Test::Unit::TestCase
  fixtures :people, :profiles

  def test_should_create_user
    assert_difference User, :count do
      user = create_user
      assert !user.new_record?, "#{user.errors.full_messages.to_sentence}"
    end
  end

  def test_should_require_login
    assert_no_difference User, :count do
      u = create_user(:login => nil)
      assert u.errors.on(:login)
    end
  end

  def test_should_require_password
    assert_no_difference User, :count do
      u = create_user(:password => nil)
      assert u.errors.on(:password)
    end
  end

  def test_should_require_password_confirmation
    assert_no_difference User, :count do
      u = create_user(:password_confirmation => nil)
      assert u.errors.on(:password_confirmation)
    end
  end

  def test_should_require_email
    assert_no_difference User, :count do
      u = create_user(:email => nil)
      assert u.errors.on(:email)
    end
  end

  def test_should_reset_password
    people(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal people(:quentin), User.authenticate('quentin', 'new password')
  end

  def test_should_not_rehash_password
    people(:quentin).update_attributes(:login => 'quentin2')
    assert_equal people(:quentin), User.authenticate('quentin2', 'test')
  end

  def test_should_authenticate_user
    assert_equal people(:quentin), User.authenticate('quentin', 'test')
  end

  def test_should_set_remember_token
    people(:quentin).remember_me
    assert_not_nil people(:quentin).remember_token
    assert_not_nil people(:quentin).remember_token_expires_at
  end

  def test_should_unset_remember_token
    people(:quentin).remember_me
    assert_not_nil people(:quentin).remember_token
    people(:quentin).forget_me
    assert_nil people(:quentin).remember_token
  end

  def test_should_have_profiles
    assert_not_nil people(:quentin).profiles
    assert_kind_of Array, people(:quentin).profiles
    people(:quentin).profiles.each { |profile|
      assert_kind_of Profile, profile
    }
  end

  def test_should_have_organizations
    user = people(:quentin)
    assert_not_nil user.organizations
    assert_kind_of Array, user.organizations
    user.organizations.each { |o|
      assert_kind_of Organization, o
    }
  end

  protected
    def create_user(options = {})
      User.create({ :login => 'quire', :email => 'quire@example.com', :password => 'quire', :password_confirmation => 'quire' }.merge(options))
    end
end
