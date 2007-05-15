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
  end

  def test_mail_to
    user = Customer.find(:first)
    mass_mail = MassMail.find(:first)
    mail = DirectMail.deliver_mail_to(user, mass_mail)
    assert_equal mass_mail.subject, mail.subject
    assert_equal mass_mail.body, mail.body
    assert_equal user.email, mail.to[0]
  end

  private
    def read_fixture(action)
      IO.readlines("#{FIXTURES_PATH}/direct_mail/#{action}")
    end

    def encode(subject)
      quoted_printable(subject, CHARSET)
    end
end
