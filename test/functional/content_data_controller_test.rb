require 'test_helper'

class ContentDataControllerTest < ActionController::TestCase
  setup do
    @content_datum = content_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_datum" do
    assert_difference('ContentDatum.count') do
      post :create, content_datum: @content_datum.attributes
    end

    assert_redirected_to content_datum_path(assigns(:content_datum))
  end

  test "should show content_datum" do
    get :show, id: @content_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_datum
    assert_response :success
  end

  test "should update content_datum" do
    put :update, id: @content_datum, content_datum: @content_datum.attributes
    assert_redirected_to content_datum_path(assigns(:content_datum))
  end

  test "should destroy content_datum" do
    assert_difference('ContentDatum.count', -1) do
      delete :destroy, id: @content_datum
    end

    assert_redirected_to content_data_path
  end
end
