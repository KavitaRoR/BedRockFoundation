require 'test_helper'

class FoundationCalculatorsControllerTest < ActionController::TestCase
  setup do
    @foundation_calculator = foundation_calculators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foundation_calculators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foundation_calculator" do
    assert_difference('FoundationCalculator.count') do
      post :create, foundation_calculator: @foundation_calculator.attributes
    end

    assert_redirected_to foundation_calculator_path(assigns(:foundation_calculator))
  end

  test "should show foundation_calculator" do
    get :show, id: @foundation_calculator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @foundation_calculator
    assert_response :success
  end

  test "should update foundation_calculator" do
    put :update, id: @foundation_calculator, foundation_calculator: @foundation_calculator.attributes
    assert_redirected_to foundation_calculator_path(assigns(:foundation_calculator))
  end

  test "should destroy foundation_calculator" do
    assert_difference('FoundationCalculator.count', -1) do
      delete :destroy, id: @foundation_calculator
    end

    assert_redirected_to foundation_calculators_path
  end
end
