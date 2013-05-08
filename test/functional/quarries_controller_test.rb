require 'test_helper'

class QuarriesControllerTest < ActionController::TestCase
  setup do
    @quarry = quarries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quarries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quarry" do
    assert_difference('Quarry.count') do
      post :create, quarry: @quarry.attributes
    end

    assert_redirected_to quarry_path(assigns(:quarry))
  end

  test "should show quarry" do
    get :show, id: @quarry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quarry
    assert_response :success
  end

  test "should update quarry" do
    put :update, id: @quarry, quarry: @quarry.attributes
    assert_redirected_to quarry_path(assigns(:quarry))
  end

  test "should destroy quarry" do
    assert_difference('Quarry.count', -1) do
      delete :destroy, id: @quarry
    end

    assert_redirected_to quarries_path
  end
end
