require File.dirname(__FILE__) + '/../test_helper'

class StockBuyTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @bank = create_bank
    @bank_account = create_bank_account
    @product_category = create_product_category
    @unit = create_unit
    @product = create_product
    @supplier_category = create_supplier_category
    @supplier = create_supplier
    @ledger_category = create_ledger_category(:type_of => Payment::TYPE_OF_EXPENSE, :is_stock => true)
    @ledger = create_ledger
  end

  def test_setup
    assert @organization.valid?
    assert @bank_account.valid?
    assert @product_category.valid?
    assert @product.valid?
    assert @supplier.valid?
    assert @ledger_category.valid?
    assert Payment.expense?(@ledger_category.type_of)
    assert @ledger_category.is_stock?
    assert @ledger.valid?
  end

  def test_relation_with_supplier
    entry = StockBuy.new
    entry.supplier = @supplier
    assert_equal @supplier, entry.supplier
  end

  def test_mandatory_field_supplier_id
    s = StockBuy.new()
    s.valid?
    assert s.errors.invalid?(:supplier_id)
    s.supplier = @supplier
    s.valid?
    assert !s.errors.invalid?(:supplier_id)
  end


  def test_mandatory_field_price
    s = StockBuy.new()
    s.valid?
    assert s.errors.invalid?(:price)
    s.price = 10
    s.valid?
    assert !s.errors.invalid?(:price)
  end

  def test_price_not_numerical
    s = StockBuy.new()
    s.price = 'some'
    s.valid?
    assert s.errors.invalid?(:price)
  end

  def test_amount_not_positive
    s = StockBuy.new()
    s.amount = -1
    s.valid?
    assert s.errors.invalid?(:amount)
  end

  def test_amount_is_positive
    s = StockBuy.new()
    s.amount = 10
    s.valid?
    assert !s.errors.invalid?(:amount)
  end

  def test_total_cost
    entry = StockBuy.create(:amount => 5,  :date => '2007-07-01',  :product_id => @product.id, :supplier => @supplier, :price => 10, :validity => Date.today )
    assert_in_delta 50, entry.total_cost, 0.01
  end


  def test_validate_cannot_be_less_than_date
    s = StockBuy.new
    s.validity = Date.today - 1
    s.date = DateTime.now
    s.valid?
    assert s.errors.invalid?(:validity)
  end

  def test_decimal_value_for_price
    p = create_stock_in()
    assert p.valid?
    p.price = 23
    assert p.save
    assert_equal 23, p.price
    p.price = "23.56"
    assert p.save
    assert_equal 2356, p.price
    p.price = "23,56"
    assert p.save
    assert_equal 23.56, p.price
  end

  def test_price= 
    p = StockBuy.new
    p.price= '2' 
    assert_equal 2, p.price
    p.price= '2.45'
    assert_equal 245, p.price
    p.price= '2,45'
    assert_equal 2.45, p.price
  end


end
