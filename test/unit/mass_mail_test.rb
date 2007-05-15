require File.dirname(__FILE__) + '/../test_helper'

class MassMailTest < Test::Unit::TestCase
  fixtures :mass_mails, :organizations

  # Replace this with your real tests.
  def test_mandatory_fields
    count = MassMail.count
    mail = MassMail.new
    assert !mail.save

    mail.subject = "New email"
    assert !mail.save

    mail.body = "la la la la la"
    assert !mail.save

    mail.organization = Organization.find(2)
    assert mail.save

    assert_equal count + 1, MassMail.count
  end
end
