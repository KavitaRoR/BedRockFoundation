require 'test_helper'

class ArrivalRangesControllerTest < ActionController::TestCase
  setup do
    @arrival_range = arrival_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:arrival_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create arrival_range" do
    assert_difference('ArrivalRange.count') do
      post :create, arrival_range: @arrival_range.attributes
    end

    assert_redirected_to arrival_range_path(assigns(:arrival_range))
  end

  test "should show arrival_range" do
    get :show, id: @arrival_range
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @arrival_range
    assert_response :success
  end

  test "should update arrival_range" do
    put :update, id: @arrival_range, arrival_range: @arrival_range.attributes
    assert_redirected_to arrival_range_path(assigns(:arrival_range))
  end

  test "should destroy arrival_range" do
    assert_difference('ArrivalRange.count', -1) do
      delete :destroy, id: @arrival_range
    end

    assert_redirected_to arrival_ranges_path
  end
end
