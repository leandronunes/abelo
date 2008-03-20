require File.dirname(__FILE__) + '/../test_helper'
require 'units_controller'

# Re-raise errors caught by the controller.
class UnitsController; def rescue_action(e) raise e end; end

class UnitsControllerTest < Test::Unit::TestCase

  under_organization :some

  def setup
    Unit.destroy_all
    @controller = UnitsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization = create_organization(:identifier => 'some')
    @unit = create_unit(:name => 'some name', :abbreviation => 'sn')
    login_as("quentin")
  end

  def test_setup
    assert @organization.valid?
  end

  def test_index
    get :index
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:units)
    assert_kind_of Array, assigns(:units)
  end

  def test_autocomplete_unit_name
    Unit.delete_all
    unit = create_unit(:name => 'some name', :abbreviation => 'sn')
    get :autocomplete_unit_name, :unit => { :name => 'some'}
    assert_not_nil assigns(:units)
    assert_kind_of Array, assigns(:units)
    assert_equal 1, assigns(:units).length
  end

  def test_list_when_query_param_not_nil
    Unit.destroy_all
    unit = create_unit(:name => 'some unit', :abbreviation => 'su')
    unit = create_unit(:name => 'another unit', :abbreviation => 'au')
    unit = create_unit(:name => 'unit three', :abbreviation => 'ut')
    get :list, :query => 'another*' 

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:units)
    assert_kind_of Array, assigns(:units)
    assert_not_nil assigns(:unit_pages)
    assert_kind_of ActionController::Pagination::Paginator, assigns(:unit_pages)
  end

  def test_show
    get :show, :id => @unit.id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:unit)
    assert assigns(:unit).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:unit)
    assert_kind_of Unit, assigns(:unit)
  end

  def test_create
    count = Unit.count

    post :create, :unit => {:name => 'Some Unit', :abbreviation => 'su'}
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end
  
  def test_create_wrong_params
    num_units = Unit.count
    post :create, :unit => {}

    assert_response :success
    assert_template 'new'

    assert_equal num_units, Unit.count
  end

  def test_edit
    Unit.delete_all
    p = create_unit
    get :edit, :id => p.id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:unit)
    assert assigns(:unit).valid?
  end

  def test_update
    post :update, :id => @unit.id
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end

  def test_update_with_wrong_params
    post :update, :id => @unit.id,:unit => {:name => nil }
    assert_response :success
    assert_not_nil assigns(:unit)
    assert_template 'edit'
  end

  #TODO make this test
#  def test_remove_supplier
#    supplier = Unit.find(1).suppliers.find(:first)
#    unit_count = supplier.units.count
#
#    post :update, :id => 1, :suppliers => { }
#    assert_response :redirect
#    assert_redirected_to :action => 'list'
#
#    assert_equal unit_count - 1, supplier.units.count
#  end

  def test_destroy
    unit_id = @unit.id
    assert_not_nil Unit.find(unit_id)

    post :destroy, :id => unit_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Unit.find(unit_id)
    }
  end

end
