require File.dirname(__FILE__) + '/../test_helper'

class ContactTest < Test::Unit::TestCase
  fixtures :contacts, :system_actors, :categories

  def setup
    @customer = Customer.find(:all).first
    @category = ContactCategory.find(:all).first
  end

  def test_mandatory_fields
    count = Contact.count

    c = Contact.new
    assert(!c.save)

    c.name = 'Test'
    assert(!c.save)

    c.system_actor_id = @customer.id
    assert(!c.save)

    c.category_id = @category.id
    assert(c.save)

    assert_equal count + 1, Contact.count
  end
  
  def test_relation_with_customer
    contact = Contact.find(1)
    assert_not_nil contact.system_actor
    assert_equal Customer, contact.system_actor.class
  end

end
