require 'test_helper'

class MaterialUsesControllerTest < ActionController::TestCase
  setup do
    @material_use = material_uses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:material_uses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create material_use" do
    assert_difference('MaterialUse.count') do
      post :create, material_use: @material_use.attributes
    end

    assert_redirected_to material_use_path(assigns(:material_use))
  end

  test "should show material_use" do
    get :show, id: @material_use
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @material_use
    assert_response :success
  end

  test "should update material_use" do
    put :update, id: @material_use, material_use: @material_use.attributes
    assert_redirected_to material_use_path(assigns(:material_use))
  end

  test "should destroy material_use" do
    assert_difference('MaterialUse.count', -1) do
      delete :destroy, id: @material_use
    end

    assert_redirected_to material_uses_path
  end
end
