require 'test_helper'

class StadiaControllerTest < ActionController::TestCase
  setup do
    @stadium = stadia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stadia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stadium" do
    assert_difference('Stadium.count') do
      post :create, :stadium => @stadium.attributes
    end

    assert_redirected_to stadium_path(assigns(:stadium))
  end

  test "should show stadium" do
    get :show, :id => @stadium.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stadium.to_param
    assert_response :success
  end

  test "should update stadium" do
    put :update, :id => @stadium.to_param, :stadium => @stadium.attributes
    assert_redirected_to stadium_path(assigns(:stadium))
  end

  test "should destroy stadium" do
    assert_difference('Stadium.count', -1) do
      delete :destroy, :id => @stadium.to_param
    end

    assert_redirected_to stadias_path
  end
end
