require File.dirname(__FILE__) + '/../test_helper'

class CustomerGroupTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @customer_group = create_customer_group
    @customer_category = create_customer_category
    @customer = create_customer
  end

  def test_setup
    assert @organization.valid?
    assert @customer_group.valid?
    assert @customer.valid?
  end

  def test_absence_of_name
    g = CustomerGroup.create
    !g.valid?

    assert g.errors.invalid?(:name)
  end
  
  def test_presence_of_name
    g = CustomerGroup.create(:name => 'Mass Mail Group')
    g.valid?
    
    assert !g.errors.invalid?(:name)
  end

  def test_absence_of_organization
    g = CustomerGroup.create(:name => 'Some mass mail group for testing')
    !g.valid?

    assert !g.errors.invalid?(:organization)
  end

  def test_uniqueness_of_name
    g_1 = create_customer_group(:name => 'Mass Mail Group')
    g_1.valid?

    assert_raise ActiveRecord::RecordInvalid do
      g_2 = create_customer_group(:name => 'Mass Mail Group')
    end

  end 

  def test_relation_with_organization
    m = CustomerGroup.create(:name => 'Some mass mail group for testing', :organization => @organization)
    assert_equal @organization, m.organization
  end

  def test_relation_with_system_actors    
    SystemActorMassMailGroup.create(:mass_mail_group => @customer_group, :system_actor => @customer)
    
    assert @customer_group.system_actors.include?(@customer)
  end

  def test_adding_a_customer
    @customer_group.system_actors << @customer
    assert @customer_group.system_actors.include?(@customer)
  end

  def test_customer_only_once_in_a_group
    @customer_group.system_actors << @customer
    count = @customer_group.system_actors.length

    assert_raise ActiveRecord::RecordInvalid do
       @customer_group.system_actors << @customer
    end
    assert_equal count, @customer_group.system_actors.length
  end

  def test_removing_a_customer
    @customer_group.system_actors << @customer

    @customer_group.system_actors.delete @customer
    assert !@customer_group.system_actors.include?(@customer)
  end

  def test_full_text_search
    mass_mail_group_1 = create_customer_group(:name => 'Group test')
    mass_mail_group_2 = create_customer_group(:name => 'Group test2')
    mass_mail_groups = CustomerGroup.full_text_search('test2')
    assert_equal 1, mass_mail_groups.length
    assert mass_mail_groups.include?(mass_mail_group_2)
  end

end
