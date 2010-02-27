require File.dirname(__FILE__) + '/../test_helper'

class ProductTest < Test::Unit::TestCase

  def setup
    @organization = create_organization
    @org = create_organization(:identifier => 'some_id', :cnpj => '62.667.776/0001-17', :name => 'some id')
    @product_category = create_product_category
    @cat_supp = SupplierCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @supplier = Supplier.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @org.id, :email => 'contato@hering.com', :category_id => @cat_supp.id)
    @ledger_category = create_ledger_category(:type_of => Payment::TYPE_OF_EXPENSE, :is_stock => true)
    @bank = create_bank
    @bank_account = create_bank_account
    @invoice  = create_invoice
    @unit = create_unit(:name => 'Unit', :abbreviation => 'kg')
    @product = create_product
  end

  def test_setup
    assert @organization.valid?
    assert @org.valid?
    assert @product_category.valid?
    assert @cat_supp.valid?
    assert @supplier.valid?
    assert @ledger_category.valid?
    assert Payment.expense?(@ledger_category.type_of)
    assert @ledger_category.is_stock?
    assert @bank_account.valid?
  end

  def test_uniqueness_of_code
    Product.delete_all
    Product.create(:name => 'product', :sell_price => 2.0, :unit_measure => @unit, :organization => @org, :category_id => @product_category.id, :code => 2)
    product = Product.new(:code => 2, :organization => @org)
    product.valid?
    assert product.errors.invalid?(:code)
        
  end

  def test_scope_of_code
    Product.delete_all
    Product.create(:name => 'product', :sell_price => 2.0, :unit_measure => @unit, :organization => @org, :category_id => @product_category.id, :code => 2)
    product = Product.new(:code => 2, :organization => @organization)
    product.save
    assert !product.errors.invalid?(:code)
  end


  def test_relation_with_organization
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit_measure => @unit, :organization_id => @org.id, :category_id => @product_category.id)
    assert_equal @org, product.organization
  end

  def test_relation_with_category
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit_measure => @unit, :organization_id => @org.id, :category_id => @product_category.id)
    assert_equal @product_category, product.category
  end

  def test_relation_with_images
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit_measure => @unit, :organization_id => @org.id, :category_id => @product_category.id)
    img = Image.new 
    img.uploaded_data = ActionController::TestUploadedFile.new(File.join(RAILS_ROOT, 'public', 'images', 'rails.png'), 'image/png')
    img.description = 'Image for testing'
    img.product = product
    img.save
    
    assert product.images.include?(img)
  end

  def test_relation_with_suppliers
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit_measure => @unit, :organization_id => @org.id, :category_id => @product_category.id)
    product.suppliers.concat(@supplier)
    assert product.suppliers.include?(@supplier)
  end

  def test_relation_with_stock_in
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit_measure => @unit, :organization_id => @org.id, :category_id => @product_category.id)
    entry = create_stock_in(:product => product)
    assert product.stocks.include?(entry)
  end

  def test_relation_with_stock_out
    Product.any_instance.stubs(:amount_in_stock).returns(342)
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit_measure => @unit, :organization_id => @org.id, :category_id => @product_category.id)
    entry = create_stock_in(:product => product)
    entry = StockOut.create!(:supplier_id => @supplier.id, :amount => -50, :date => '2007-07-02', :product_id => product.id, :price => 10)
    assert product.stocks.include?(entry)
  end

  def test_mandatory_field_name
    product = Product.create(:sell_price => 2.0, :unit_measure => @unit, :organization_id => @org.id, :category_id => @product_category.id)
    assert product.errors.invalid?(:name)
  end

  def test_mandatory_field_sell_price
    product = Product.create(:name => 'Image of product', :unit_measure => @unit, :organization_id => @org.id, :category_id => @product_category.id)
    assert product.errors.invalid?(:sell_price)
  end

  def test_mandatory_field_unit_measure
    product =create_product()
    product.unit_measure = nil 
    product.valid?
    assert product.errors.invalid?(:unit_measure_id)
  end

  def test_mandatory_field_organization_id
    product = Product.create(:name => 'Image of product', :sell_price => 2.0, :unit_measure => @unit, :category_id => @product_category.id)
    assert product.errors.invalid?(:organization_id)
  end

  def test_mandatory_field_category_id
    product = Product.create(:name => 'Image of product', :sell_price => 2.0, :unit_measure => @unit, :organization_id => @org.id)
    assert product.errors.invalid?(:category_id)
  end

  def test_full_text_search
    Product.delete_all
    product1 = Product.create!(:name => 'test product', :sell_price => 2.0, :unit_measure => @unit, :organization => @org, :category => @product_category, :code => 1)
    product2 = Product.create!(:name => 'te_product', :sell_price => 2.0, :unit_measure => @unit, :organization => @org, :category => @product_category, :code => 2)
    products = Product.full_text_search('test*')
    assert_equal 1, products.length
    assert products.include?(product1)
  end

  def test_amount_in_stock
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit_measure => @unit, :organization_id => @org.id, :category_id => @product_category.id)

    # generate 10 stock ins
    total_amount = 0.0
    total_cost = 0.0

    (1..10).each { |n|
      entry = create_stock_in(:product => product, :status => Status::STATUS_DONE)
      total_amount += entry.amount
      total_cost += entry.price * entry.amount
    }

    assert_equal total_amount, product.amount_in_stock
    assert_in_delta total_cost, product.total_cost, 0.01
  end

  def test_sum_only_done_stocks
    Stock.destroy_all
    p = create_product(:name => 'Some Name')
    amount = 90
    create_stock_buy(:product => p, :status => Status::STATUS_DONE, :amount => amount)
    create_stock_buy(:product => p, :status => Status::STATUS_PENDING, :amount => 34)
    assert_equal amount, p.amount_in_stock
  end

  def test_image
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit_measure => @unit, :organization_id => @org.id, :category_id => @product_category.id)
    img = Image.new 
    img.uploaded_data = ActionController::TestUploadedFile.new(File.join(RAILS_ROOT, 'public', 'images', 'rails.png'), 'image/png')
    img.description = 'Image for testing'
    img.product = product
    img.save
    
    assert_equal img,  product.image
  end

  def test_presence_of_code
    Product.destroy_all
    p = create_product
    p.code=nil
    p.valid?
    assert_equal 2, p.code
  end

  def test_suggest_code
    Product.destroy_all
    p = Product.new
    assert_equal 1, p.suggest_code
    create_product(:organization => @organization)
    p = Product.new(:organization => @organization)
    assert_equal 2, p.suggest_code
  end

  def test_decimal_value_for_sell_price
    p = create_product(:name => 'Some name')  
    assert p.valid?
    p.sell_price = 23
    assert p.save
    assert_equal 23, p.sell_price
    p.sell_price = "23.56"
    assert p.save
    assert_equal 2356, p.sell_price
    p.sell_price = "23,56"
    assert p.save
    assert_equal 23.56, p.sell_price
  end

  def test_sell_price= 
    p = Product.new
    p.sell_price= '2'
    assert_equal 2, p.sell_price
    p.sell_price= '2.45'
    assert_equal 245, p.sell_price
    p.sell_price= '2,45'
    assert_equal 2.45, p.sell_price
  end

  def test_add_new_product_on_tracker_product_points
    products_points = @organization.tracker.product_points
    create_product
    assert_equal products_points + 1, Organization.find_by_identifier('one').tracker.product_points
  end

  def test_add_first_product_on_tracker_product_points
    assert_equal 0, @org.tracker.product_points
    
    create_product(:organization => @org)
    assert_equal 1, Organization.find_by_identifier('some_id').tracker.product_points
  end

  def test_remove_product_on_tracker_product_points
    product_points = @organization.tracker.product_points
    @organization.products.first.destroy
    assert_equal product_points - 1, Organization.find_by_identifier('one').tracker.product_points
  end

  def test_remove_uniq_product_on_tracker_product_points
    assert_equal 0, @org.tracker.product_points
    
    create_product(:organization => @org)
    @org.products.first.destroy
    assert_equal 0, Organization.find_by_identifier('some_id').tracker.product_points
  end
end
