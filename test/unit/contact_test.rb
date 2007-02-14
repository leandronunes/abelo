require File.dirname(__FILE__) + '/../test_helper'

class ContactTest < Test::Unit::TestCase
  fixtures :contacts
  fixtures :customers

  def setup
    @customer = Customer.find(1)
  end

  def test_mandatory_fields
    count = Contact.count

    c = Contact.new
    assert(!c.save)

    c.phone = '5555-5555'
    assert(!c.save)

    c.email = 'test@test.test'
    assert(!c.save)

    c.name = 'Test'
    assert(!c.save)

    c.customer_id = @customer.id
    assert(c.save)

    assert_equal count + 1, Contact.count
  end
  
  def test_relation_with_customer
    contact = Contact.find(1)
    assert_not_nil contact.customer
    assert_equal Customer, contact.customer.class
  end

end
