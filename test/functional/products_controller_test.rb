require File.dirname(__FILE__) + '/../test_helper'
require 'products_controller'

# Re-raise errors caught by the controller.
class ProductsController; def rescue_action(e) raise e end; end

class ProductsControllerTest < Test::Unit::TestCase

  under_organization :some

  def setup
    Organization.destroy_all
    @controller = ProductsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @organization = create_organization(:identifier => 'some')
    @product_category ||= create_product_category(:organization => @organization)
    @unit = create_unit
    @product = create_product
    login_as("quentin")
  end

  def test_setup
    assert @organization.valid?
    assert @product_category.valid?
    assert @product.valid?
    assert @unit.valid?
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:products)
    assert_kind_of Array, assigns(:products)
  end

  def test_autocomplete_product_name
    Product.delete_all
    product = Product.create!(:name => 'test product', :sell_price => 2.0, :unit_measure => @unit, :organization => @organization, :category => @product_category)
    get :autocomplete_product_name, :product => { :name => 'test'}
    assert_not_nil assigns(:products)
    assert_kind_of Array, assigns(:products)
    assert_equal 1, assigns(:products).length
  end

  def test_list_when_query_param_not_nil
    Product.delete_all
    create_product(:name => 'Some Product')
    create_product(:name => 'Another Product')
    create_product(:name => 'Product Three')
    get :list, :query => 'Another*' 

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:products)
    assert_kind_of Array, assigns(:products)
    assert_not_nil assigns(:product_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:product_pages)
  end

  def test_show
    get :show, :id => @product.id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:product)
    assert assigns(:product).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:product)
    assert_kind_of Product, assigns(:product)
    assert_equal @organization, assigns(:product).organization
  end

  def test_create
    count = Product.count
    supplier = create_supplier
    assert supplier.valid?

    post :create, :id => 1, :product => {:name => 'Some Product', :sell_price => '20', :unit_measure => @unit, :organization_id => 1, :category_id => 1, :supplier_ids => [supplier.id.to_s] }
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end
  
  def test_create_wrong_params
    num_products = Product.count
    post :create, :product => {}

    assert_response :success
    assert_template 'new'

    assert_equal num_products, Product.count
  end

  def test_edit
    Product.delete_all
    p = create_product
    get :edit, :id => p.id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:product)
    assert assigns(:product).valid?
  end

  def test_edit_product_not_found
    Product.delete_all
    create_product(:name => 'Some Product')
    get :edit, :id => 2

    assert_response :success
    assert_template 'shared/not_found'
  end

  def test_update
    post :update, :id => @product.id
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  #TODO make this test with :name => nil

  def test_update_with_wrong_params
    product = Product.new
    product.name = 'Test Department'
    product.sell_price = 20
    product.unit_measure = @unit
    product.organization = @organization
    product.category = @product_category
    assert product.save!
    post :update, :id => product.id,:product => {:name => nil }
    assert_response :success
    assert_not_nil assigns(:product)
    assert_not_nil assigns(:sizes)
    assert_not_nil assigns(:colors)
    assert_not_nil assigns(:units)
    assert_template 'edit'
  end

  #TODO make this test
#  def test_remove_supplier
#    supplier = Product.find(1).suppliers.find(:first)
#    product_count = supplier.products.count
#
#    post :update, :id => 1, :suppliers => { }
#    assert_response :redirect
#    assert_redirected_to :action => 'list'
#
#    assert_equal product_count - 1, supplier.products.count
#  end

  def test_destroy
    product_id = @product.id
    assert_not_nil Product.find(product_id)

    post :destroy, :id => product_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Product.find(product_id)
    }
  end


  def test_images
    post :images, :id => @product.id
    assert_template 'images'
    assert_not_nil assigns(:product)
    assert_not_nil assigns(:image)
    assert_equal @product.id, assigns(:product).id
  end

  def test_add_images
    images_count = @organization.products.find(@product.id).images.size

    post :add_image, :id => @product.id, :image => { :description => 'a test image', :picture => File.open(File.join(RAILS_ROOT,'public/images/rails.png')) }

    assert_redirected_to :action => 'images'
    assert_equal images_count + 1, @organization.products.find(@product.id).images.size
  end

  def test_add_image_not_saved

    post :add_image, :id => @product.id, :image => {}

    assert_response :success
    assert_template 'images'
  end

  def test_remove_image
    post :add_image, :id => @product.id, :image => { :description => 'a test image', :picture => File.open(File.join(RAILS_ROOT,'public/images/rails.png')) }
    images_count = @organization.products.find(@product.id).images.size

    post :remove_image, :image_id => @organization.products.find(@product.id).image.id

    assert_redirected_to :action => 'images'
    assert_equal images_count - 1, @organization.products.find(@product.id).images.size
  end

  def test_new_stock_entry
    get :new_stock_entry
    assert_response :success
  end

end
