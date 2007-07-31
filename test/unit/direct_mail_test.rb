require File.dirname(__FILE__) + '/../test_helper'
require 'direct_mail'

class DirectMailTest < Test::Unit::TestCase
  FIXTURES_PATH = File.dirname(__FILE__) + '/../fixtures'
  CHARSET = "utf-8"

  include ActionMailer::Quoting

  def setup
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    @expected = TMail::Mail.new
    @expected.set_content_type "text", "plain", { "charset" => CHARSET }
    @org = Organization.create(:name => 'Organization for testing', :cnpj => '63182452000151', :nickname => 'org')
  end

  def test_mail_to
    customer = Customer.new(:name => 'Customer for testing', :organization_id => @org.id, :email => 'testing@email', :cpf => '65870844274')
    mass_mail = MassMail.create(:body => 'Body for testing', :subject => 'Subject for testing', :organization_id => @org.id)
    emails = Array.new
    emails.push(customer.email)
    mail = DirectMail.deliver_mail_to(emails, mass_mail)

    assert_equal mass_mail.subject, mail.subject
    assert_equal mass_mail.body, mail.body
    assert_equal customer.email, mail.to[0]
  end

  private
    def read_fixture(action)
      IO.readlines("#{FIXTURES_PATH}/direct_mail/#{action}")
    end

    def encode(subject)
      quoted_printable(subject, CHARSET)
    end
end
