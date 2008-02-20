require File.dirname(__FILE__) + '/../test_helper'
require 'periodicities_controller'

# Re-raise errors caught by the controller.
class PeriodicitiesController; def rescue_action(e) raise e end; end

class PeriodicitiesControllerTest < Test::Unit::TestCase
  fixtures :periodicities, :configurations, :organizations

  under_organization :some

  def setup
    @controller = PeriodicitiesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    @organization = create_organization(:identifier => 'some', :name => 'some')
    @another_organization = create_organization(:identifier => 'another_org')
    @periodicity = create_periodicity
    login_as("quentin")
  end

  def create_periodicity(params = {})
    Periodicity.create!(
      {
        :name => 'Some Name', 
        :number_of_days => '30', 
        :organization => @organization  
      }.merge(params)
    )
  end

  def test_autocomplete_periodicity_name
    Periodicity.delete_all
    create_periodicity(:name => 'test name')
    create_periodicity(:name => 'another name')
    get :autocomplete_periodicity_name, :periodicity => { :name => 'test'}, :periodicity_type => 'product'
    assert_not_nil assigns(:periodicities)
    assert_kind_of Array, assigns(:periodicities)
    assert_equal 1, assigns(:periodicities).length
  end



  def test_setup
    assert @periodicity.valid?
    assert @organization.valid?
    assert @another_organization.valid?
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

    assert_not_nil assigns(:periodicities)
  end

  def test_show
    get :show, :id => @periodicity.id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:periodicity)
    assert assigns(:periodicity).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:periodicity)
  end

  def test_create_periodicity_of_the_permited_organization
    Periodicity.delete_all
    post :create, :periodicity => {:name => 'Somethig', :number_of_days => 30, :organization => @another_organization}
    assert_equal 1, @organization.periodicities.length
    assert_equal 0, @another_organization.periodicities.length
  end

  def test_create_successfully
    num_periodicities = Periodicity.count

    post :create, :periodicity => {:name => 'CreateP', :number_of_days => '30'}
    
    assert_response :redirect
    assert_redirected_to :action => 'list'
    assert_equal num_periodicities + 1, Periodicity.count
  end

  def test_create_unsuccessfully
    num_periodicities = Periodicity.count

    post :create, :periodicity => {:name => nil, :number_of_days => '30'}

    assert_response :success
    assert_template 'new'
    assert_equal num_periodicities, Periodicity.count
  end


  def test_edit
    get :edit, :id => @periodicity.id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:periodicity)
  end

  def test_update_periodicity_of_the_permited_organization
    Periodicity.delete_all
    p = Periodicity.create!(:name => 'Month', :number_of_days => '30', :organization => @another_organization  )
    assert_raise(ActiveRecord::RecordNotFound){ post :update, :id => p.id, :periodicity => {:name => 'Somethig'}}
  end

  def test_update_successfully
    post :update, :id => @periodicity.id, :periodicity => {:name => 'A new name'}
    assert_response :redirect
    assert_redirected_to :action => 'show'
  end

  def test_update_unsuccessfully
    post :update, :id => @periodicity.id, :periodicity => {:name => nil}
    assert_response :success
    assert_template 'edit'
  end

  def test_update_name
    Periodicity.delete_all
    p = Periodicity.create!(:name => 'Month', :number_of_days => '30', :organization => @organization  )
    new_name = 'Another Month'
    assert_not_equal new_name, p.name
    post :update, :id => p.id, :periodicity => {:name => new_name}
    assert_equal new_name, Periodicity.find(p.id).name
  end

  def test_update_number_of_days
    Periodicity.delete_all
    p = Periodicity.create!(:name => 'Month', :number_of_days => '30', :organization => @organization  )
    new_number = 3
    assert_not_equal new_number, p.number_of_days
    post :update, :id => p.id, :periodicity => {:number_of_days => new_number}
    assert_equal new_number, Periodicity.find(p.id).number_of_days
  end

  def test_destroy_periodicity_of_the_permited_organization
    Periodicity.delete_all
    p = Periodicity.create!(:name => 'Month', :number_of_days => '30', :organization => @another_organization  )
    assert_raise(ActiveRecord::RecordNotFound){ post :destroy, :id => p.id}
  end


  def test_destroy
    assert_nothing_raised {
      Periodicity.find(@periodicity.id)
    }
    id = @periodicity.id
    post :destroy, :id => @periodicity.id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Periodicity.find(id)
    }
  end
end
