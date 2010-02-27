require File.dirname(__FILE__) + '/../test_helper'

class LedgerTest < Test::Unit::TestCase

  include Status

  def setup
    create_place
    @organization = create_organization
    @bank = create_bank
    @bank_account = create_bank_account
    @periodicity = create_periodicity
    @ledger_category = create_ledger_category
    @ledger = create_ledger
  end

  def test_setup
    assert @ledger.valid?
    assert @organization.valid?
    assert @periodicity.valid?
    assert @ledger_category.valid?
  end

  def test_money_payment_is_associated_to_a_ledger_category_with_money
    LedgerCategory.destroy_all
    category = create_ledger_category(:payment_methods => [Payment::MONEY])
    l = new_ledger(:payment_method => Payment::MONEY, :category => category)
    l.valid?
    assert !l.errors.invalid?(:payment_method)

    category = create_ledger_category(:payment_methods => [Payment::CHECK], :name => 'Another')
    l = new_ledger(:payment_method => Payment::MONEY, :category => category)
    l.valid?
    assert l.errors.invalid?(:payment_method)
  end

  def test_check_payment_is_associated_to_a_ledger_category_with_check
    LedgerCategory.destroy_all
    category = create_ledger_category(:payment_methods => [Payment::CHECK])
    l = new_ledger(:payment_method => Payment::CHECK, :category => category)
    l.valid?
    assert !l.errors.invalid?(:payment_method)

    category = create_ledger_category(:payment_methods => [Payment::MONEY], :name => 'Another')
    l = new_ledger(:payment_method => Payment::CHECK, :category => category)
    l.valid?
    assert l.errors.invalid?(:payment_method)
  end


  def test_credit_card_payment_is_associated_to_a_ledger_category_with_credit_card
    LedgerCategory.destroy_all
    category = create_ledger_category(:payment_methods => [Payment::CREDIT_CARD])
    l = new_ledger(:payment_method => Payment::CREDIT_CARD, :category => category)
    l.valid?
    assert !l.errors.invalid?(:payment_method)

    category = create_ledger_category(:payment_methods => [Payment::CHECK], :name => 'Another')
    l = new_ledger(:payment_method => Payment::CREDIT_CARD, :category => category)
    l.valid?
    assert l.errors.invalid?(:payment_method)
  end


  def test_debit_card_money_payment_is_associated_to_a_ledger_category_with_debit_card
    LedgerCategory.destroy_all
    category = create_ledger_category(:payment_methods => [Payment::DEBIT_CARD])
    l = new_ledger(:payment_method => Payment::DEBIT_CARD, :category => category)
    l.valid?
    assert !l.errors.invalid?(:payment_method)

    category = create_ledger_category(:payment_methods => [Payment::CHECK], :name => 'Another')
    l = new_ledger(:payment_method => Payment::DEBIT_CARD, :category => category)
    l.valid?
    assert l.errors.invalid?(:payment_method)
  end

  def test_validates_presence_of_payment_method
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:payment_method)
    l.payment_method =  Payment::MONEY
    l.valid?
    assert !l.errors.invalid?(:payment_method)
  end

  def test_validates_inclusion_of_payment_method_in_list
    l = Ledger.new
    l.payment_method =  'some'
    l.valid?
    assert l.errors.invalid?(:payment_method)
    l.payment_method =  Payment::MONEY
    l.valid?
    assert !l.errors.invalid?(:payment_method)
  end

  def test_validates_presence_of_type_of
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:type_of)
    l.type_of =  Payment::TYPE_OF_INCOME
    l.valid?
    assert !l.errors.invalid?(:type_of)
  end

  def test_validates_inclusion_of_type_of_in_list
    l = Ledger.new
    l.type_of =  'some'
    l.valid?
    assert l.errors.invalid?(:type_of)
    l.type_of =  Payment::TYPE_OF_INCOME
    l.valid?
    assert !l.errors.invalid?(:type_of)
  end

  def test_validates_presence_of_bank_account
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:bank_account_id)
    l.bank_account = BankAccount.find(:first)
    l.valid?
    assert !l.errors.invalid?(:bank_account_id)
  end

  def test_validates_presence_of_organization
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:organization_id)
    l.organization = @organization
    l.valid?
    assert !l.errors.invalid?(:organization_id)
  end

  def test_validates_presence_of_owner
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:owner_id)
    assert l.errors.invalid?(:owner_type)
    l.owner = @organization
    l.valid?
    assert !l.errors.invalid?(:owner_id)
    assert !l.errors.invalid?(:owner_type)
  end


  def test_creation_of_ledgers_when_a_schedule_ledgers_is_needed
    Ledger.delete_all

    l = Ledger.new
    l.owner = @organization
    l.organization = @organization
    l.category = @ledger_category
    l.value = 300
    l.description = 'some description'
    l.tag_list = 'tag_test'
    l.date = Date.today
    l.bank_account = BankAccount.find(:first)
    l.schedule_repeat = true
    l.schedule_periodicity = create_periodicity(:name => 'some name')
    l.schedule_interval = 2
    l.payment_method = 'money'
    
    assert l.save!
    assert_equal 3, Ledger.count
  end

  def test_creation_of_ledgers_when_a_schedule_ledgers_is_needed_but_the_ledger_was_not_created
    Ledger.delete_all

    l = Ledger.new
    l.category = LedgerCategory.find(:first)
    l.value = nil #value is missing 
    l.description = 'some description'
    l.tag_list = 'tag_test'
    l.date = Date.today
    l.bank_account = BankAccount.find(:first)
    l.schedule_repeat = true
    l.schedule_periodicity = create_periodicity(:name => 'some name')
    l.schedule_interval = 2
    
    assert !l.save
    assert_equal 0, Ledger.count
  end

  def test_date_creation_of_ledgers_when_ledger_is_schedule
    Ledger.destroy_all

    l = Ledger.new
    l.owner = @organization
    l.organization = @organization
    l.category = @ledger_category
    l.value = 300
    l.description = 'some description'
    l.tag_list = 'tag_test'
    l.date = Date.today
    l.bank_account = BankAccount.find(:first)
    l.schedule_repeat = true
    periodicity = create_periodicity(:name => 'another name')
    l.schedule_periodicity = periodicity
    interval = 2
    l.schedule_interval = interval
    l.payment_method = 'money'
    assert l.save!
    assert_equal 3, Ledger.count
    
    ledgers = Ledger.find(:all, :order => "foreseen_date")
    for i in 0..interval do
      first = ledgers.first
      date = DateTime.now + periodicity.number_of_days * i
      assert first.date.to_datetime.between?(date - 1, date)
      assert ledgers.delete(first)
    end
  end


  def test_presence_of_schedule_interval_when_schedule_repeat_and_schedule_periodicity_are_present
    l = Ledger.new
    l.schedule_repeat = true
    l.schedule_periodicity= Periodicity.find(:first)
    l.valid?
    assert l.errors.invalid?(:schedule_interval)
  end

  def test_presence_of_schedule_interval_when_schedule_repeat_is_present
    l = Ledger.new
    l.schedule_repeat = true
    l.valid?
    assert l.errors.invalid?(:schedule_interval)
  end

  def test_presence_of_schedule_interval_when_schedule_periodicity_is_present
    l = Ledger.new
    l.schedule_periodicity= Periodicity.find(:first)
    l.valid?
    assert l.errors.invalid?(:schedule_interval)
  end

  def test_presence_of_schedule_periodicity_when_schedule_repeat_and_schedule_interval_are_present
    l = Ledger.new
    l.schedule_repeat = true
    l.schedule_interval= 1
    l.valid?
    assert l.errors.invalid?(:schedule_periodicity)
  end

  def test_presence_of_schedule_periodicity_when_schedule_repeat_is_present
    l = Ledger.new
    l.schedule_repeat = true
    l.valid?
    assert l.errors.invalid?(:schedule_periodicity)
  end

  def test_presence_of_schedule_periodicity_when_schedule_interval_is_present
    l = Ledger.new
    l.schedule_interval= 1
    l.valid?
    assert l.errors.invalid?(:schedule_periodicity)
  end

  def test_presence_of_schedule_repeat_when_schedule_periodicity_and_schedule_interval_are_not_present
    l = Ledger.new
    l.valid?
    assert !l.errors.invalid?(:schedule_repeat)
  end

  def test_presence_of_schedule_repeat_when_schedule_periodicity_is_present
    l = Ledger.new
    l.valid?
    assert !l.errors.invalid?(:schedule_repeat)
    l.schedule_periodicity = @periodicity
    l.valid?
    assert l.errors.invalid?(:schedule_repeat)
  end

  def test_presence_of_schedule_repeat_when_schedule_interval_is_present
    l = Ledger.new
    l.valid?
    assert !l.errors.invalid?(:schedule_repeat)
    l.schedule_interval = 1
    l.valid?
    assert l.errors.invalid?(:schedule_repeat)
  end

  def test_presence_of_schedule_repeat_when_schedule_interval_and_schedule_periodicity_are_present
    l = Ledger.new
    l.valid?
    assert !l.errors.invalid?(:schedule_repeat)
    l.schedule_interval = 1
    l.schedule_periodicity = Periodicity.find(:first)
    l.valid?
    assert l.errors.invalid?(:schedule_repeat)
  end

  def test_precense_of_foreseen_date
    l = Ledger.new
    l[:foreseen_date] = nil
    l.valid?
    assert l.errors.invalid?(:foreseen_date)
    assert_raise(RuntimeError){l.foreseen_date = 1}
    l.date = Date.today
    l.valid?
    assert !l.errors.invalid?(:foreseen_date)
  end

  def test_precense_of_effective_date
    l = Ledger.new
    l.status = STATUS_DONE
    # Set the foreseen_date and effective_date date to nil to test the presence of effective_date
    l[:foreseen_date] = nil
    l[:effective_date] = nil
    l.valid?
    assert l.errors.invalid?(:effective_date)
    assert_raise(RuntimeError){l.effective_date = 1}
    l.date = Date.today
    l.valid?
    assert !l.errors.invalid?(:effective_date)
  end

  def test_precense_of_effective_date_when_is_foreseen
    l = Ledger.new
    l.status = STATUS_PENDING
    l.date =  Date.today
    l.valid?
    assert !l.errors.invalid?(:effective_date)
  end


  def test_precense_of_foressen_value
    l = Ledger.new
    l.valid?
    assert l.errors.invalid?(:foreseen_value)
    assert_raise(RuntimeError){l.foreseen_value = 1}
    l.value = 1
    l.valid?
    assert !l.errors.invalid?(:foreseen_value)
  end

  def test_precense_of_effective_value
    l = Ledger.new
    l.status = STATUS_DONE
    l.valid?
    assert l.errors.invalid?(:effective_value)
    assert_raise(RuntimeError){l.effective_value = 1}
    l.value = 1
    l.valid?
    assert !l.errors.invalid?(:effective_value)
  end

  def test_precense_of_effective_value_when_is_foreseen
    l = Ledger.new
    l.status = STATUS_PENDING
    l.value = 1
    l.valid?
    assert !l.errors.invalid?(:effective_value)
  end

  def test_numericality_of_value
    l = Ledger.new
    l.value = 'a'
    l.valid?
    assert_equal 0, l.value
    l.value = ''
    l.valid?
    assert_equal 0, l.value
    l.value = 12
    l.valid?
    assert !l.errors.invalid?(:value)
  end

  def test_schedule_mandatory_fields_param_schedule_repeat_when_all_informations_correct
    ledger = @ledger
    ledger.schedule_repeat = true
    ledger.schedule_periodicity = @periodicity
    ledger.schedule_interval = 34
    ledger.valid?
    assert !ledger.errors.invalid?(:schedule_repeat)

  end

  def test_schedule_mandatory_fields_param_schedule_repeat_when_periodicity_is_nil
    ledger = @ledger
    ledger.schedule_repeat = true
    ledger.schedule_periodicity = nil
    ledger.schedule_interval = 34
    ledger.valid?
    assert !ledger.errors.invalid?(:schedule_repeat)
  end

  def test_schedule_mandatory_fields_param_schedule_repeat_when_interval_is_nil
    ledger = @ledger
    ledger.schedule_repeat = true
    ledger.schedule_periodicity = @periodicity
    ledger.schedule_interval = nil
    ledger.valid?
    assert !ledger.errors.invalid?(:schedule_repeat)
  end

  def test_schedule_mandatory_fields_param_schedule_repeat_when_interval_and_periodicity_is_nil
    ledger = @ledger
    ledger.schedule_repeat = true
    ledger.schedule_periodicity = nil
    ledger.schedule_interval = nil
    ledger.valid?
    assert !ledger.errors.invalid?(:schedule_repeat)

    ledger.schedule_repeat = false
    ledger.schedule_periodicity = nil
    ledger.schedule_interval = nil
    ledger.valid?
    assert !ledger.errors.invalid?(:schedule_repeat)
  end

  def test_schedule_mandatory_fields_param_schedule_repeat_true_and_interval_and_periodicity_exist
    ledger = @ledger
    ledger.schedule_periodicity = @periodicity
    ledger.schedule_interval = 34
    ledger.schedule_repeat = false
    ledger.valid?
    assert ledger.errors.invalid?(:schedule_repeat)
  end

  def test_schedule_mandatory_fields_param_schedule_repeat_false_and_periodicity_is_nil
    ledger = @ledger
    ledger.schedule_periodicity = nil
    ledger.schedule_interval = 34
    ledger.schedule_repeat = false
    ledger.valid?
    assert ledger.errors.invalid?(:schedule_repeat)
  end

  def test_schedule_mandatory_fields_param_schedule_repeat_false_and_interval_is_nil
    ledger = @ledger
    ledger.schedule_periodicity = @periodicity
    ledger.schedule_interval = nil
    ledger.schedule_repeat = false
    ledger.valid?
    assert ledger.errors.invalid?(:schedule_repeat)
  end

  def test_value_did_not_return_nil
    p = Ledger.new
    p.value = nil
    assert_not_nil p.value
  end

  def test_value_attribution_argument_is_nil
    p = Ledger.new
    p.value = nil
  end

  def test_effective_date_when_done
    ledger = create_ledger()
    assert ledger.pending?
    assert_nil ledger.effective_date
    ledger.done!
    assert_not_nil ledger.effective_date
  end

  def test_effective_value_when_done
    ledger = create_ledger()
    assert ledger.pending?
    assert_nil ledger.effective_value
    ledger.done!
    assert_not_nil ledger.effective_value
  end

  def test_find_balance_of_month_with_existing_balance
    Ledger.destroy_all
    Balance.destroy_all
    l = create_ledger(:organization => @organization, :date => Date.today, :status => STATUS_DONE)
    assert_not_nil l.find_balance_of_month
    assert_equal 1, Ledger.count
    assert_equal 1, Balance.count
    assert_equal Balance.find(:first), l.find_balance_of_month
  end

  def test_find_balance_of_month_whitout_an_existing_balance
    Ledger.destroy_all
    l = create_ledger(:organization => @organization, :date => Date.today)
    Balance.destroy_all
    assert_nil l.find_balance_of_month
  end

  def test_create_balance_of_month
    Ledger.destroy_all
    Balance.destroy_all
    l = create_ledger(:organization => @organization, :date => Date.today, :status => STATUS_DONE)
    assert_not_nil l.find_balance_of_month
    assert_equal 1, Balance.count
  end

  def test_create_balance_when_save_the_first_ledger_of_month
    Ledger.destroy_all
    l = create_ledger(:organization => @organization, :date => Date.today, :status => STATUS_DONE)
    assert_not_nil l.find_balance_of_month
    assert_equal 1, Balance.find(:all).length

    l = create_ledger(:organization => @organization)
    l = create_ledger(:organization => @organization, :status => STATUS_DONE)

    assert_not_nil l.find_balance_of_month
    assert_equal 1, Balance.find(:all).length
  end

  def test_dont_create_balance_when_save_the_ledgers_of_a_month
    Ledger.destroy_all
    l = create_ledger(:organization => @organization, :date => Date.today, :status => STATUS_DONE)
    assert_not_nil l.find_balance_of_month
    assert_equal 1, Balance.find(:all).length

    l = create_ledger(:organization => @organization, :date => Date.today, :status => STATUS_DONE)
    assert_not_nil l.find_balance_of_month
    assert_equal 1, Balance.find(:all).length
  end

  def test_sum_balance_value_after_ledger_creation
    Ledger.destroy_all
    l = create_ledger(:organization => @organization, :date => Date.today, :status => STATUS_DONE)
    b = l.find_balance_of_month
    assert_not_nil b
    value = b.value
    l = create_ledger(:organization => @organization, :date => Date.today, :value => 23, :status => STATUS_DONE)
    b = l.find_balance_of_month
    assert_equal value + 23, b.value

    value = b.value
    l = create_remove_cash(:organization => @organization, :date => Date.today, :value => 54, :status => STATUS_DONE)
    assert_equal 3, Ledger.count
    assert_equal value - 54, l.find_balance_of_month.value
  end

  def test_update_balance_value_after_ledgers_destruction
    Ledger.destroy_all
    l = create_ledger(:organization => @organization, :date => Date.today, :status => STATUS_DONE)
    b = l.find_balance_of_month
    assert_not_nil b
    value = b.value

    l = create_ledger(:organization => @organization, :date => Date.today, :value => 23, :status => STATUS_DONE)
    b = l.find_balance_of_month
    assert_equal value + 23, b.value

    l.destroy
    assert_equal value, l.find_balance_of_month.value
  end

  def test_ledger_cannot_be_effective_on_date_after_the_current_date
    l = create_ledger(:date => Date.today + 2)
    assert l.pending?
    assert Date.today < l.date
    l.done!
    assert l.errors.invalid?(:status)
    l = Ledger.find(l.id)
    assert l.pending?
    l.date = Date.today
    l.done!
    l = Ledger.find(l.id)
    assert !l.pending?
  end

  def test_initialize_organization
    l = Ledger.new()
    assert_nil l.organization
    
    l = Ledger.new(:owner => @organization)
    assert_equal @organization, l.organization
    sale = create_sale(:organization => @organization, :user_id => 1 )
    l = Ledger.new(:owner => sale)
    assert_not_equal sale, l.organization, "Only organization owner can be the organization of a ledger"
    assert_nil l.organization, "Only organization owner can be the organization of a ledger"

    o = create_organization(:identifier => 'another_some', :name => 'another name')
    l = Ledger.new(:organization => o)
    assert_equal o, l.organization
  end

  def test_initialize_owner
    l = Ledger.new()
    assert_nil l.owner
    
    l = Ledger.new(:organization => @organization)
    assert_equal @organization, l.owner

    o = create_organization(:identifier => 'another_some', :name => 'another name')
    l = Ledger.new(:owner => o)
    assert_equal o, l.owner
  end

  def test_initialize_bank_account
    l = Ledger.new()
    assert_nil l.bank_account
    
    l = Ledger.new(:organization => @organization)
    assert_equal @organization.default_bank_account, l.bank_account
  end

  def test_needs_fiscal_printer_condition_1
    l = Ledger.new
    l.needs_fiscal_command = true
    Ledger.any_instance.expects(:has_fiscal_printer?).returns(true)
    Ledger.any_instance.expects(:printer_command).returns(nil)
    assert l.needs_fiscal_command?, "You need a fiscal printer command when you set needs_fiscal_command to true, has the fiscal printer on organization configuration and dont't have a fiscal printer associated to the ledger"
  end

  def test_needs_fiscal_printer_condition_2
    l = Ledger.new
    l.needs_fiscal_command = true
    Ledger.any_instance.expects(:has_fiscal_printer?).returns(false)
    Ledger.stubs(:printer_command).returns(nil)
    assert !l.needs_fiscal_command?, "You don't need a fiscal printer command when you hasn't the fiscal printer on organization configuration"
  end

  def test_needs_fiscal_printer_condition_3
    l = Ledger.new
    l.needs_fiscal_command = true
    Ledger.any_instance.expects(:has_fiscal_printer?).returns(true)
    Ledger.any_instance.expects(:printer_command).returns(mock())
    assert !l.needs_fiscal_command?, "You don't need a fiscal printer command when already have it"
  end

  def test_needs_fiscal_printer_condition_4
    l = Ledger.new
    l.needs_fiscal_command = false
    Ledger.any_instance.expects(:has_fiscal_printer?).returns(true)
    Ledger.any_instance.expects(:printer_command).returns(nil)
    assert !l.needs_fiscal_command?, "You don't need a fiscal printer command when you set needs_fiscal_command to false"
  end

  def test_needs_fiscal_printer_condition_5
    l = Ledger.new
    l.needs_fiscal_command = false
    Ledger.any_instance.expects(:has_fiscal_printer?).returns(false)
    Ledger.stubs(:printer_command).returns(nil)
    assert !l.needs_fiscal_command?, "You don't need a fiscal printer command when you set needs_fiscal_command to false and haven't the fiscal printer on organization condfiguration"
  end

  def test_needs_fiscal_printer_condition_6
    l = Ledger.new
    l.needs_fiscal_command = false
    Ledger.any_instance.expects(:has_fiscal_printer?).returns(true)
    Ledger.any_instance.expects(:printer_command).returns(mock)
    assert !l.needs_fiscal_command?, "You don't need a fiscal printer command when you set needs_fiscal_command to false and haven't the fiscal printer on organization configuration and already have the printer_command"
  end

  def test_add_new_ledger_on_tracker_ledger_points
    ledger_points = @organization.tracker.ledger_points
    create_ledger
    assert_equal ledger_points + 1, Organization.find_by_identifier('one').tracker.ledger_points
  end

  def test_add_first_ledger_on_tracker_ledger_points
    org = create_organization(:identifier => 'some_id', :cnpj => '62.667.776/0001-17', :name => 'some id')
    assert_equal 0, org.tracker.ledger_points
    create_ledger(:organization => org)
    assert_equal 1, Organization.find_by_identifier('some_id').tracker.ledger_points
  end

  def test_remove_ledger_on_tracker_ledger_points
    ledger_points = @organization.tracker.ledger_points
    @organization.ledgers.first.destroy
    assert_equal ledger_points - 1, Organization.find_by_identifier('one').tracker.ledger_points
  end

  def test_remove_uniq_ledger_on_tracker_ledger_points
    org = create_organization(:identifier => 'some_id', :cnpj => '62.667.776/0001-17', :name => 'some id')
    assert_equal 0, org.tracker.ledger_points

    create_ledger(:organization => org)
    org.ledgers.first.destroy
    assert_equal 0, Organization.find_by_identifier('some_id').tracker.ledger_points
  end

  should "return if the ledger is a fiscal operation or not" do
    l = Ledger.new(:payment_method => Payment::ADD_CASH, :organization => @organization )
    assert_equal false, l.is_fiscal_operation?, "The ledger is a fiscal operation only with a fiscal printer associated to the oragnziation" 
    Organization.any_instance.expects(:has_fiscal_printer?).times(1).returns(true)
    l = Ledger.new(:payment_method => Payment::ADD_CASH, :organization => @organization )
    assert l.is_fiscal_operation?, "All add cash operations with fiscal printer must be a fiscal operation"

    Organization.any_instance.expects(:has_fiscal_printer?).times(1).returns(true)
    l = Ledger.new(:payment_method => Payment::REMOVE_CASH, :organization => @organization )
    assert l.is_fiscal_operation?, "All remove cash operations with fiscal printer must be a fiscal operation"

    Organization.any_instance.expects(:has_fiscal_printer?).times(1).returns(true)
    l = Ledger.new(:payment_method => Payment::CHANGE, :organization => @organization )
    assert l.is_fiscal_operation?, "All change operations with fiscal printer must be a fiscal operation"

    Organization.any_instance.expects(:has_fiscal_printer?).times(1).returns(true)
    l = Ledger.new(:payment_method => Payment::MONEY, :organization => @organization )
    assert_equal false, l.is_fiscal_operation?, "Money operations are fiscal operation only associated to a sale"
    
    Organization.any_instance.expects(:has_fiscal_printer?).times(1).returns(true)
    l = Ledger.new(:payment_method => Payment::CHECK, :organization => @organization )
    assert_equal false, l.is_fiscal_operation?, "Check operations are fiscal operation only associated to a sale"
    
    Organization.any_instance.expects(:has_fiscal_printer?).times(1).returns(true)
    l = Ledger.new(:payment_method => Payment::CREDIT_CARD, :organization => @organization )
    assert_equal false, l.is_fiscal_operation?, "Credit Card operations are fiscal operation only associated to a sale"
    
    Organization.any_instance.expects(:has_fiscal_printer?).times(1).returns(true)
    l = Ledger.new(:payment_method => Payment::DEBIT_CARD, :organization => @organization )
    assert_equal false, l.is_fiscal_operation?, "Debit Card operations are fiscal operation only associated to a sale"
    
    Organization.any_instance.expects(:has_fiscal_printer?).times(1).returns(true)
    l = Ledger.new(:payment_method => Payment::MONEY, :organization => @organization, :owner => Sale.new )
    assert l.is_fiscal_operation?, "Money operations are fiscal operation when associated to a sale"

    Organization.any_instance.expects(:has_fiscal_printer?).times(1).returns(true)
    l = Ledger.new(:payment_method => Payment::CHECK, :organization => @organization, :owner => Sale.new )
    assert l.is_fiscal_operation?, "Check operations are fiscal operation when associated to a sale"

    Organization.any_instance.expects(:has_fiscal_printer?).times(1).returns(true)
    l = Ledger.new(:payment_method => Payment::CREDIT_CARD, :organization => @organization, :owner => Sale.new )
    assert l.is_fiscal_operation?, "Credit card operations are fiscal operation when associated to a sale"

    Organization.any_instance.expects(:has_fiscal_printer?).times(1).returns(true)
    l = Ledger.new(:payment_method => Payment::DEBIT_CARD, :organization => @organization, :owner => Sale.new )
    assert l.is_fiscal_operation?, "Debit card operations are fiscal operation when associated to a sale"

  end

  should "have effective date" do
    l = Ledger.new(:date => Date.today,:status => Status::STATUS_DONE )
    assert_not_nil l.date
    assert_not_nil l.foreseen_date
    assert_not_nil l.effective_date
  end

end
