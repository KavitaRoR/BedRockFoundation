require 'test_helper'

class MaterialQuantityLabelsControllerTest < ActionController::TestCase
  setup do
    @material_quantity_label = material_quantity_labels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:material_quantity_labels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create material_quantity_label" do
    assert_difference('MaterialQuantityLabel.count') do
      post :create, material_quantity_label: @material_quantity_label.attributes
    end

    assert_redirected_to material_quantity_label_path(assigns(:material_quantity_label))
  end

  test "should show material_quantity_label" do
    get :show, id: @material_quantity_label
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @material_quantity_label
    assert_response :success
  end

  test "should update material_quantity_label" do
    put :update, id: @material_quantity_label, material_quantity_label: @material_quantity_label.attributes
    assert_redirected_to material_quantity_label_path(assigns(:material_quantity_label))
  end

  test "should destroy material_quantity_label" do
    assert_difference('MaterialQuantityLabel.count', -1) do
      delete :destroy, id: @material_quantity_label
    end

    assert_redirected_to material_quantity_labels_path
  end
end
