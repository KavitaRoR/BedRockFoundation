require 'test_helper'

class DayCrewBlocksControllerTest < ActionController::TestCase
  setup do
    @day_crew_block = day_crew_blocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:day_crew_blocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create day_crew_block" do
    assert_difference('DayCrewBlock.count') do
      post :create, day_crew_block: @day_crew_block.attributes
    end

    assert_redirected_to day_crew_block_path(assigns(:day_crew_block))
  end

  test "should show day_crew_block" do
    get :show, id: @day_crew_block
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @day_crew_block
    assert_response :success
  end

  test "should update day_crew_block" do
    put :update, id: @day_crew_block, day_crew_block: @day_crew_block.attributes
    assert_redirected_to day_crew_block_path(assigns(:day_crew_block))
  end

  test "should destroy day_crew_block" do
    assert_difference('DayCrewBlock.count', -1) do
      delete :destroy, id: @day_crew_block
    end

    assert_redirected_to day_crew_blocks_path
  end
end
