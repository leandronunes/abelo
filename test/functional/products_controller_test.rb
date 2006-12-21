require File.dirname(__FILE__) + '/../test_helper'
require 'products_controller'

# Re-raise errors caught by the controller.
class ProductsController; def rescue_action(e) raise e end; end

class ProductsControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :products

  def setup
    @controller = ProductsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    @organization = Organization.find_by_nickname 'one'
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
  end

  def test_show
    get :show, :id => 1

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
  end

  def test_create
    num_products = Product.count

    post :create, :product => { :description => 'Testing adding a product through controller', :sell_price => 99.99, :organization_id => 1, :category_id => 1 }

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_products + 1, Product.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:product)
    assert assigns(:product).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Product.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Product.find(1)
    }
  end


  def test_images
    post :images, :id => 1
    assert_template 'images'
    assert_not_nil assigns(:product)
    assert_not_nil assigns(:image)
    assert_equal 1, assigns(:product).id
  end

  def test_add_images
    images = @organization.products.find(1).images.size

    post :add_image, :id => 1, :image => { :description => 'a test image', :picture => File.open(File.join(RAILS_ROOT,'public/images/rails.png')) }

    assert_redirected_to :action => 'images'
    assert_equal images + 1, @organization.products.find(1).images.size
  end

end
