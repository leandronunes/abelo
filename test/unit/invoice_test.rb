require File.dirname(__FILE__) + '/../test_helper'

class InvoiceTest < Test::Unit::TestCase

  fixtures :system_actors, :products

  def setup
    @organization = create_organization
    @supplier = Supplier.find(:first)
    @product = create_product
  end

  def test_setup
    assert @organization.valid?
    assert @supplier.valid?
    assert @product.valid?
    assert @organization.products.include?(@product)
  end

  def create_invoice(params = {})
    i =  Invoice.new({:number => 3434, :serie => 343, :organization => @organization, 
         :supplier => @supplier, :issue_date => Date.today}.merge(params))
    i.save
    i
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

  def test_destroy_stock_ins_when_invoice_is_destroyed
    i = create_invoice
    stock_in_count = StockIn.count
    stock_in = StockIn.new(:price => 223, :amount => 3, :product_id => 1)
    stock_in.invoice = i
    assert stock_in.save
    stock_in = StockIn.new(:price => 223, :amount => 3, :product_id => 2)
    stock_in.invoice = i
    assert stock_in.save
    assert i.destroy
    assert_equal stock_in_count, StockIn.count
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

end
