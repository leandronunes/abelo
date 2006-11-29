require File.dirname(__FILE__) + '/../test_helper'

class OrganizationTest < Test::Unit::TestCase
  fixtures :organizations

  def test_mandatory_fields
    count = Organization.count

    org = Organization.new
    assert(!org.save)

    org.name = 'Organization for testing mandatory fields'
    assert(!org.save)

    org.cnpj = '77635813000182'
    assert(!org.save)

    org.nickname = 'testing_mandatory_fields'
    assert(org.save)

    assert_equal(count + 1, Organization.count)
  end
end
