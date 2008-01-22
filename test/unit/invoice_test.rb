require File.dirname(__FILE__) + '/../test_helper'

class InvoiceTest < Test::Unit::TestCase

  fixtures :system_actors

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


end
