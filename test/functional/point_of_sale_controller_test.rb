require File.dirname(__FILE__) + '/../test_helper'
require 'point_of_sale_controller'

# Re-raise errors caught by the controller.
class PointOfSaleController; def rescue_action(e) raise e end; end

class PointOfSaleControllerTest < Test::Unit::TestCase

  def test_true
    assert true
  end

#TODO make this test
#  fixtures :sales, :sale_items, :system_actors, :people, :products
#
#  under_organization :one
#
#  def setup
#    @controller = PointOfSaleController.new
#    @request    = ActionController::TestRequest.new
#    @response   = ActionController::TestResponse.new
#    @user = User.find(:first)
#    @organization = Organization.find(:first)
#    @product = Product.find(:first)
#    @sale = Sale.find(:first)
#    login_as('seu_ze')
#  end
#
#  def test_setup
#    assert @organization.valid?
#    assert @user.valid?
#    assert @sale.valid?
#    assert @organization.sales.include?(@sale)
#    assert @product.valid?
#    assert @organization.products.include?(@product)
#  end
#
#  def test_index
#    get :index
#    assert_response :success 
#    assert_template 'index'
#    assert_not_nil assigns(:pending_sale)
#  end
#
#  def test_coupon_open_with_new_sale
#    Sale.delete_all
# 
#    get :coupon_open
#    assert_response :success
#    assert_template 'coupon_open'
#    assert_equal 1, Sale.find(:all).length
#    assert_not_nil assigns(:sale)
#    assert_not_nil assigns(:total)
#    assert_kind_of Sale, assigns(:sale)
#  end
#
#  def test_coupon_open_with_pending_sale
#    Sale.delete_all
#    sale = Sale.create!(:date => '2007-08-04', :organization => @organization, :salesman => @user)
# 
#    get :coupon_open
#    assert_response :success
#    assert_template 'coupon_open'
#    assert_not_nil assigns(:sale)
#    assert_not_nil assigns(:total)
#    assert_kind_of Sale, assigns(:sale)
#  end
#
#  def test_coupon_cancel_with_unexisting_id_param
#    Sale.delete_all
#    id = 100 #unexisting id
#    
#    post :coupon_cancel, :id => id
#    assert_response :redirect
#    assert_redirected_to :action => 'index'
#  end
#
#  def test_coupon_cancel_when_the_coupon_is_open
#    Sale.delete_all
#    sale = Sale.create!(:date => '2007-08-04', :organization => @organization, :salesman => @user)
#    
#    post :coupon_cancel, :id => sale.id
#    assert_response :redirect
#    assert_redirected_to :action => 'index'
#  end
#
#  def test_coupon_cancel_when_the_coupon_is_closed
#    Sale.delete_all
#    sale = Sale.create(:date => '2007-08-04', :organization => @organization, :salesman => @user)
#    sale.close!
#    assert sale.save
#    post :coupon_cancel, :id => sale.id
#    assert_response :redirect
#    assert_redirected_to :action => 'index'
#  end
#
#  def test_refresh_product_with_a_valid_product_code
#    post :refresh_product, :id => @sale.id, :product_code => @product.code
#    assert_response :success
#    assert_template '_product_info'
#    assert assigns(:product)
#    assert assigns(:sale)
#    assert assigns(:sale_item)
#  end
#
#  def test_refresh_product_with_a_invalid_product_code
#    Product.delete_all
#    post :refresh_product, :id => @sale.id, :product_code => 1
#    assert_response :success
#    assert_template '_product_info'
#    assert_nil assigns(:product)
#    assert assigns(:sale)
#    assert assigns(:sale_item)
#  end
#
#  def test_add_item_with_a_valid_product_code
#    num_items = @sale.items.length
#    post :add_item, :id => @sale.id, :sale_item =>{ :product_code => @product.code, :amount => 2}
#    assert_response :success
#    assert_template '_sale'
#    assert assigns(:sale)
#    assert assigns(:total)
#    @sale = Sale.find(@sale.id)
#    assert_equal num_items + 1, @sale.items.length
#  end
#
#  def test_add_item_with_a_invalid_product_code
#    num_items = @sale.items.length
#    invalid_product_code = 100
#    post :add_item, :id => @sale.id, :sale_item =>{ :product_code => invalid_product_code, :amount => 2}
#    assert_response :success
#    assert_template '_sale'
#    assert assigns(:sale)
#    assert assigns(:total)
#    @sale = Sale.find(@sale.id)
#    assert_equal num_items, @sale.items.length
#  end
#
#

#  def test_set_customer
#    assert_nil Sale.find(2).customer
#    post :set_customer, :id => 2, :customer_id => 1
#    assert_response :success
#    assert_equal Customer.find(1), Sale.find(2).customer
#  end
#
#  def test_change_customer
#    assert_equal Customer.find(1), Sale.find(1).customer
#    post :set_customer, :id => 1, :customer_id => 2
#    assert_response :success
#    assert_equal Customer.find(2), Sale.find(1).customer
#  end
#
#  def test_add_item
#    count = SaleItem.count
#    post :add_item, :id => 1, :product_id => 1, :amount => 5
#    assert_response :success
#    assert_equal count + 1, SaleItem.count
#  end
#
#  def test_close
#    get :close, :id => 1
#    assert_response :redirect
#    assert_not_nil assigns(:sale) 
#    assert_redirected_to :action => 'index'
#  end

end
