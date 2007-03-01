require File.dirname(__FILE__) + '/../test_helper'

class ContactPositionTest < Test::Unit::TestCase
  fixtures :contact_positions

  # Replace this with your real tests.
  def test_mandatory_fields
    count = ContactPosition.count

    p = ContactPosition.new
    assert !p.save

    p.name = 'A position for testing mandatory fields'
    assert !p.save

    p.organization = Organization.find(1)
    assert p.save

    assert_equal count + 1, ContactPosition.count
  end

end
