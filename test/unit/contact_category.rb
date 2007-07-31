require File.dirname(__FILE__) + '/../test_helper'

class ContactCategoryTest < Test::Unit::TestCase
  fixtures :contacts, :categories, :system_actors, :organizations

  def setup
    @contact_category = ContactCategory.find(:all).first
  end

  def test_organization
    assert_equal Organization, @contact_category.organization.class
  end

  def test_contacts
    count = @contact_category.contacts.count
    contact = Contact.find(3)
    @contact_category.contacts.concat(contact)
    assert_equal count+1, @contact_category.contacts.count
  end

end
