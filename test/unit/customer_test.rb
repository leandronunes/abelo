require File.dirname(__FILE__) + '/../test_helper'

class CustomerTest < Test::Unit::TestCase
  fixtures :customers
  fixtures :organizations

  # Replace this with your real tests.
  def setup
    @organization = Organization.find(1)
  end

  def test_mandatory_fields
    count = Customer.count

    c = Customer.new
    assert(!c.save)

  end

end
