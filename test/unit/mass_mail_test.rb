require File.dirname(__FILE__) + '/../test_helper'

class MassMailTest < Test::Unit::TestCase

  def setup
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_mandatory_field_subject
    mail = MassMail.new
    mail.body = "Email body"
    mail.organization = Organization.find(2)
    mail.save
    assert mail.errors.invalid?(:subject)
    assert_equal 1, mail.errors.count
  end

  def test_relation_with_organization
    mail = MassMail.create(:subject => "Email subject", :body => "Email body", :organization_id => @org.id)
    assert_equal mail.organization, @org
  end

end
