require File.dirname(__FILE__) + '/../test_helper'
require 'units_controller'

# Re-raise errors caught by the controller.
class UnitsController; def rescue_action(e) raise e end; end

class UnitsControllerTest < ActionController::TestCase

  under_organization :one

  def setup  
    Organization.destroy_all
    UnitMeasure.destroy_all
    User.delete_all
    @organization = create_organization(:identifier => 'one')
    @environment = create_environment(:is_default => true)
    @user = create_user
    login_as(@user.login)
    @unit = create_unit
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
    UnitMeasure.delete_all
    unit = create_unit(:name => 'some name', :abbreviation => 'sn')
    get :autocomplete_unit_name, :unit => { :name => 'some'}
    assert_not_nil assigns(:units)
    assert_kind_of Array, assigns(:units)
    assert_equal 1, assigns(:units).length
  end

  def test_list_when_query_param_not_nil
    UnitMeasure.destroy_all
    unit = create_unit(:name => 'some unit', :abbreviation => 'su')
    unit = create_unit(:name => 'another unit', :abbreviation => 'au')
    unit = create_unit(:name => 'unit three', :abbreviation => 'ut')
    get :list, :query => 'another*' 

    assert_not_nil assigns(:query)
    assert_not_nil assigns(:units)
    assert_kind_of Array, assigns(:units)
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
    assert_kind_of UnitMeasure, assigns(:unit)
  end

  def test_create
    count = UnitMeasure.count

    post :create, :unit => {:name => 'Some Unit', :abbreviation => 'su'}
    assert_response :redirect
    assert_redirected_to :action => 'list'
  end
  
  def test_create_wrong_params
    num_units = UnitMeasure.count
    post :create, :unit => {}

    assert_response :success
    assert_template 'new'

    assert_equal num_units, UnitMeasure.count
  end

  def test_edit
    UnitMeasure.delete_all
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
#    supplier = UnitMeasure.find(1).suppliers.find(:first)
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
    assert_not_nil UnitMeasure.find(unit_id)

    post :destroy, :id => unit_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      UnitMeasure.find(unit_id)
    }
  end

end
