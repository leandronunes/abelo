require File.dirname(__FILE__) + '/../test_helper'

class InvoiceTest < Test::Unit::TestCase

  fixtures :system_actors, :products

  def setup
    @organization = create_organization
    @supplier = Supplier.find(:first)
    @product_category = create_product_category
    @product = create_product

  end

  def test_setup
    assert @organization.valid?
    assert @supplier.valid?
    assert @product.valid?
    assert @organization.products.include?(@product)
  end

  def test_presence_of_number
    i = Invoice.new
    i.valid?
    assert i.errors.invalid?(:number)

    i.number = 3423
    i.valid?
    assert !i.errors.invalid?(:number)
  end


  def test_presence_of_serie
    i = Invoice.new
    i.valid?
    assert i.errors.invalid?(:serie)

    i.serie = 3423
    i.valid?
    assert !i.errors.invalid?(:serie)
  end


  def test_presence_of_supplier
    i = Invoice.new
    i.valid?
    assert i.errors.invalid?(:supplier_id)

    i.supplier = Supplier.find(:first)
    i.valid?
    assert !i.errors.invalid?(:supplier_id)
  end

  def test_presence_of_issue_date
    i = Invoice.new
    i.valid?
    assert i.errors.invalid?(:issue_date)

    i.issue_date = Date.today
    i.valid?
    assert !i.errors.invalid?(:issue_date)
  end

  def test_invoice_is_pending_on_create
    i = Invoice.new
    assert_equal Status::STATUS_PENDING, i.status
  end

  def test_presence_of_status
    i = Invoice.new
    i.status = nil
    i.valid?
    assert i.errors.invalid?(:status)

    i.status = Status::STATUS_DONE
    i.valid?
    assert !i.errors.invalid?(:status)
  end

  def test_destroy_stock_buys_when_invoice_is_destroyed
    i = create_invoice
    stock_in_count = StockBuy.count
    stock_in = create_stock_buy(:product => @product, :invoice => i)
    assert stock_in.save
    p = create_product(:name => 'some')
    stock_in = create_stock_buy(:product => p, :invoice => i )
    assert stock_in.save
    i.reload
    assert i.destroy
    assert_equal stock_in_count, StockBuy.count
  end


  def test_change_stock_status_when_change_the_invoice_status
    StockBuy.destroy_all
    i = create_invoice(:status => Status::STATUS_PENDING)
    create_stock_buy(:product => @product, :status => Status::STATUS_PENDING, :invoice => i)
    p = create_product(:name => 'some')
    create_stock_buy(:product => p, :status => Status::STATUS_PENDING, :invoice => i)
    i.reload
    i.stock_buys.each do |s|
      assert_equal Status::STATUS_PENDING, s.status
    end
    i.status = Status::STATUS_DONE
    i.save
    i.reload
    i.stock_buys.each do |s|
      assert_equal Status::STATUS_DONE, s.status
    end
  end

  def test_full_text_search
    Invoice.delete_all 
    invoice1 = create_invoice(:number => 111111)
    invoice2 = create_invoice(:number => 222222)
    invoice3 = create_invoice(:number => 333333)
    invoices = Invoice.full_text_search('1*')
    assert_equal 1, invoices.length
    assert invoices.include?(invoice1)
  end

  def test_total_cost
    stock_in1 = mock()
    stock_in1.stubs(:total_cost).returns(23)
    stock_in2 = mock()
    stock_in2.stubs(:total_cost).returns(15)
    Invoice.any_instance.stubs(:stock_buys).returns([stock_in1, stock_in2])
    i = Invoice.new
    assert_equal 38, i.total_cost
  end

  def test_total_cost_whithout_stock_buys_on_invoice
    Invoice.any_instance.stubs(:stock_buys).returns([])
    i = Invoice.new
    assert_equal 0, i.total_cost
  end

  def test_total_amount
# FIXME how to make this test with mock?
#    stock_in1 = mock()
#    stock_in1.stubs(:amount).returns(4)
#    stock_in2 = mock()
#    stock_in2.stubs(:amount).returns(7)
#    Invoice.any_instance.stubs(:stock_buys).returns([stock_in1, stock_in2])
    i = create_invoice
    create_stock_buy(:amount => 11, :invoice => i)
    create_stock_buy(:amount => 7, :invoice => i)
    i.reload
    assert_equal 18, i.total_amount
  end

  def test_total_amount_whithout_stock_buys_on_invoice
    i = create_invoice
    assert_equal 0, i.total_amount
  end

  def test_total_payment
    i = create_invoice
    create_ledger(:value => 23, :owner => i, :category => create_ledger_category(:name => 'another name'))
    create_ledger(:value => 7, :owner => i)
    i.reload
    assert_equal 30, i.total_payment
  end

  def test_total_payment_whithout_stock_buys_on_invoice
    i = create_invoice
    assert_equal 0, i.total_payment
  end

  def test_balance
    i = Invoice.new
    Invoice.any_instance.stubs(:total_cost).returns(34)
    Invoice.any_instance.stubs(:total_payment).returns(-20)
    assert_equal 14, i.balance
  end

  def test_describe_field
    i = Invoice.new
    assert_not_equal 0, i.describe_field('status', 0)
    assert_not_equal 1, i.describe_field('status', 1)
    assert_not_equal 2, i.describe_field('status', 2)
  end


end
