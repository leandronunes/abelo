require File.dirname(__FILE__) + '/../test_helper'

class ContactTest < Test::Unit::TestCase
  fixtures :contacts, :system_actors, :categories

  def setup
    @customer = Customer.find(:all).first
    @category = ContactCategory.find(:all).first
  end

  def test_name_is_mandatory
    c = Contact.new
    c.valid?
    assert c.errors.invalid?(:name)
    c.name = 'Test'
    c.valid?
    assert !c.errors.invalid?(:name)
  end

end
