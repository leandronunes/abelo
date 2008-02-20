require File.dirname(__FILE__) + '/../test_helper'

class ProductTest < Test::Unit::TestCase

  fixtures :ledger_categories, :bank_accounts
 
  def setup
    @organization = create_organization
    @org = create_organization(:identifier => 'some_id', :cnpj => '62.667.776/0001-17', :name => 'some id')
    @cat_prod = ProductCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @cat_supp = SupplierCategory.create(:name => 'Category for testing', :organization_id => @org.id)
    @supplier = Supplier.create!(:name => 'Hering', :cnpj => '58178734000145', :organization_id => @org.id, :email => 'contato@hering.com', :category_id => @cat_supp.id)
    @ledger_category = LedgerCategory.find(:first)
    @ledger_category.type_of = 'I'
    @ledger_category.is_stock = true
    @ledger_category.save
    @bank_account = BankAccount.find(:first)
    @invoice  = create_invoice
    @product = create_product
  end

  def create_invoice
    i =  Invoice.new(:number => 3434, :serie => 343, :organization => @organization,
         :supplier => @supplier, :issue_date => Date.today) 
    i.save
    i
  end 

  def create_product(params = {})
    Product.create({:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization => @organization, :category => @category}.merge(params))
  end

  def create_stock_in(params = {})
    StockIn.create!({:supplier_id => @supplier.id, :amount => 50, :date => '2007-07-01', 
                    :product => @product, :validity => Date.today, :price => 10, :invoice => @invoice}.merge(params))
  end

  def test_setup
    assert @organization.valid?
    assert @org.valid?
    assert @cat_prod.valid?
    assert @cat_supp.valid?
    assert @supplier.valid?
    assert @ledger_category.valid?
    assert Payment.income?(@ledger_category.type_of)
    assert @ledger_category.is_stock?
    assert @bank_account.valid?
  end

  def test_uniqueness_of_code
    Product.delete_all
    Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization => @org, :category_id => @cat_prod.id, :code => 2)
    product = Product.new(:code => 2, :organization => @org)
    product.valid?
    assert product.errors.invalid?(:code)
        
  end

  def test_scope_of_code
    Product.delete_all
    Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization => @org, :category_id => @cat_prod.id, :code => 2)
    product = Product.new(:code => 2, :organization => @organization)
    product.save
    assert !product.errors.invalid?(:code)
  end


  def test_relation_with_organization
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    assert_equal @org, product.organization
  end

  def test_relation_with_category
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    assert_equal @cat_prod, product.category
  end

  def test_relation_with_images
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    img = Image.new 
    stream = StringIO.new(File.read("#{RAILS_ROOT}/public/images/rails.png"))
    def stream.original_filename
      'rails.png'
    end
    def stream.content_type
      'image/png'
    end
    img.description = ('Image for testing')
    img.picture = stream
    img.product = product
    img.save
    
    assert product.images.include?(img)
  end

  def test_relation_with_suppliers
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    product.suppliers.concat(@supplier)
    assert product.suppliers.include?(@supplier)
  end

  def test_relation_with_stock_in
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    entry = create_stock_in(:product => product)
    assert product.stocks.include?(entry)
  end

  def test_relation_with_stock_out
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    entry = create_stock_in(:product => product)
    entry = StockOut.create!(:supplier_id => @supplier.id, :amount => -50, :date => '2007-07-02', :product_id => product.id, :price => 10)
    assert product.stocks.include?(entry)
  end

  def test_mandatory_field_name
    product = Product.create(:sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    assert product.errors.invalid?(:name)
  end

  def test_mandatory_field_sell_price
    product = Product.create(:name => 'Image of product', :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    assert product.errors.invalid?(:sell_price)
  end

  def test_mandatory_field_unit
    product =create_product()
    product.unit = nil 
    product.valid?
    assert product.errors.invalid?(:unit)
  end

  def test_mandatory_field_organization_id
    product = Product.create(:name => 'Image of product', :sell_price => 2.0, :unit => 'kg', :category_id => @cat_prod.id)
    assert product.errors.invalid?(:organization_id)
  end

  def test_mandatory_field_category_id
    product = Product.create(:name => 'Image of product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id)
    assert product.errors.invalid?(:category_id)
  end

  def test_full_text_search
    Product.delete_all
    product1 = Product.create!(:name => 'test product', :sell_price => 2.0, :unit => 'kg', :organization => @org, :category => @cat_prod, :code => 1)
    product2 = Product.create!(:name => 'te_product', :sell_price => 2.0, :unit => 'kg', :organization => @org, :category => @cat_prod, :code => 2)
    products = Product.full_text_search('test*')
    assert_equal 1, products.length
    assert products.include?(product1)
  end

  def test_amount_in_stock
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)

    # generate 10 stock ins
    total_amount = 0.0
    total_cost = 0.0

    (1..10).each { |n|
      entry = create_stock_in(:product => product)
      total_amount += entry.amount
      total_cost += entry.price * entry.amount
    }

    assert_equal total_amount, product.amount_in_stock
    assert_in_delta total_cost, product.total_cost, 0.01
  end

  def test_image
    product = Product.create(:name => 'product', :sell_price => 2.0, :unit => 'kg', :organization_id => @org.id, :category_id => @cat_prod.id)
    img = Image.new 
    stream = StringIO.new(File.read("#{RAILS_ROOT}/public/images/rails.png"))
    def stream.original_filename
      'rails.png'
    end
    def stream.content_type
      'image/png'
    end
    img.description = ('Image for testing')
    img.picture = stream
    img.product = product
    img.save
    
    assert_equal img,  product.image
  end
  
end
