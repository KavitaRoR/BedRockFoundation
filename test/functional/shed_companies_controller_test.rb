require 'test_helper'

class ShedCompaniesControllerTest < ActionController::TestCase
  setup do
    @shed_company = shed_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shed_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shed_company" do
    assert_difference('ShedCompany.count') do
      post :create, shed_company: @shed_company.attributes
    end

    assert_redirected_to shed_company_path(assigns(:shed_company))
  end

  test "should show shed_company" do
    get :show, id: @shed_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shed_company
    assert_response :success
  end

  test "should update shed_company" do
    put :update, id: @shed_company, shed_company: @shed_company.attributes
    assert_redirected_to shed_company_path(assigns(:shed_company))
  end

  test "should destroy shed_company" do
    assert_difference('ShedCompany.count', -1) do
      delete :destroy, id: @shed_company
    end

    assert_redirected_to shed_companies_path
  end
end
