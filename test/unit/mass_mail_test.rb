require File.dirname(__FILE__) + '/../test_helper'

class MassMailTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
  end

  def test_presence_of_organization
    m = MassMail.create(:subject => 'Test', :body => 'E-mail for test')
    m.valid?
    assert m.errors.invalid?(:organization_id)
    
    m.organization = @organization 
    m.valid?
    assert !m.errors.invalid?(:organization)
  end

  def test_presence_of_subject
    m = MassMail.create(:body => 'E-mail for test', :organization => @organization)
    m.valid?
    assert m.errors.invalid?(:subject)

    m.subject = 'Test'
    m.valid?
    assert !m.errors.invalid?(:subject)
  end

  def test_presence_of_body
    m = MassMail.create(:subject => 'Test', :organization => @organization)
    m.valid?
    assert m.errors.invalid?(:body)

    m.body = 'E-mail'
  end

  def test_associated_to_organization
    m = MassMail.create!(:subject => 'Test', :body => 'E-mail for test', :organization => @organization)
    assert @organization.mass_mails.include?(m)
  end

  def test_full_text_search
    mass_mail_1 = MassMail.create!(:subject => 'Test', :body => 'E-mail for te', :organization => @organization)
    mass_mail_2 = MassMail.create!(:subject => 'Test_2', :body => 'E-mail for test', :organization => @organization)
    mass_mails = MassMail.full_text_search('test*')
    assert_equal 2, mass_mails.length
    assert mass_mails.include?(mass_mail_1)
 end  

end
