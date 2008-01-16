require File.dirname(__FILE__) + '/../test_helper'

class StockInTest < Test::Unit::TestCase

  fixtures :ledger_categories, :bank_accounts, :organizations

  def setup
    @organization = Organization.find_by_identifier('six') 
    @bank_account = BankAccount.find(:first)
    @cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    @product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @organization.id, :category_id => @cat_prod.id) 
    cat_supp = SupplierCategory.create(:name => 'Category for testing', :organization_id => @organization.id)
    @supplier = Supplier.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @organization.id, :email => 'contato@hering.com', :category_id => cat_supp.id)

    @ledger_category = LedgerCategory.find(:first)
    @ledger_category.type_of = 'I'
    @ledger_category.is_stock = true
    @ledger_category.save!
    @ledger = Ledger.create_ledger!(:category => @ledger_category, :value => 1.00, :date => DateTime.now, :bank_account => @bank_account, :owner => @organization)
  end

  def test_setup
    assert @organization.valid?
    assert @bank_account.valid?
    assert @cat_prod.valid?
    assert @product.valid?
    assert @supplier.valid?
    assert @ledger_category.valid?
    assert Payment.income?(@ledger_category.type_of)
    assert @ledger_category.is_stock?
    assert @ledger.valid?
  end

  def test_relation_with_supplier
    entry = StockIn.new
    entry.supplier = @supplier
    assert_equal @supplier, entry.supplier
  end

  def test_mandatory_field_supplier_id
    s = StockIn.new()
    s.valid?
    assert s.errors.invalid?(:supplier_id)
    s.supplier = @supplier
    s.valid?
    assert !s.errors.invalid?(:supplier_id)
  end


  def test_mandatory_field_price
    s = StockIn.new()
    s.valid?
    assert s.errors.invalid?(:price)
    s.price = 10
    s.valid?
    assert !s.errors.invalid?(:price)
  end

  def test_price_not_numerical
    s = StockIn.new()
    s.price = 'some'
    s.valid?
    assert s.errors.invalid?(:price)
  end

  def test_amount_not_positive
    s = StockIn.new()
    s.amount = -1
    s.valid?
    assert s.errors.invalid?(:amount)
  end

  def test_amount_is_positive
    s = StockIn.new()
    s.amount = 10
    s.valid?
    assert !s.errors.invalid?(:amount)
  end

  def test_total_cost
    entry = StockIn.create(:amount => 5,  :date => '2007-07-01',  :product_id => @product.id, :supplier => @supplier, :price => 10, :validity => Date.today )
    assert_in_delta 50, entry.total_cost, 0.01
  end


  def test_validate_cannot_be_less_than_date
    s = StockIn.new
    s.validity = Date.today - 1
    s.date = DateTime.now
    s.valid?
    assert s.errors.invalid?(:validity)
  end

end
