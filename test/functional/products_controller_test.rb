require File.dirname(__FILE__) + '/../test_helper'
require 'products_controller'

# Re-raise errors caught by the controller.
class ProductsController; def rescue_action(e) raise e end; end

class ProductsControllerTest < Test::Unit::TestCase

  include TestingUnderOrganization

  fixtures :organizations, :products, :system_actors, :categories

  def setup
    @controller = ProductsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization_nickname = 'one'
    @organization = Organization.find_by_nickname 'one'
    login_as("quentin")
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
    assert_kind_of Product, assigns(:product)
    assert_equal @organization, assigns(:product).organization
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
    assert_redirected_to :action => 'list'
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
    images_count = @organization.products.find(1).images.size

    post :add_image, :id => 1, :image => { :description => 'a test image', :picture => File.open(File.join(RAILS_ROOT,'public/images/rails.png')) }

    assert_redirected_to :action => 'images'
    assert_equal images_count + 1, @organization.products.find(1).images.size
  end

end
