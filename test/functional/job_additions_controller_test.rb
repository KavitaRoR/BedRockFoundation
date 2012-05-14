require 'test_helper'

class JobAdditionsControllerTest < ActionController::TestCase
  setup do
    @job_addition = job_additions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_additions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_addition" do
    assert_difference('JobAddition.count') do
      post :create, job_addition: @job_addition.attributes
    end

    assert_redirected_to job_addition_path(assigns(:job_addition))
  end

  test "should show job_addition" do
    get :show, id: @job_addition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_addition
    assert_response :success
  end

  test "should update job_addition" do
    put :update, id: @job_addition, job_addition: @job_addition.attributes
    assert_redirected_to job_addition_path(assigns(:job_addition))
  end

  test "should destroy job_addition" do
    assert_difference('JobAddition.count', -1) do
      delete :destroy, id: @job_addition
    end

    assert_redirected_to job_additions_path
  end
end
