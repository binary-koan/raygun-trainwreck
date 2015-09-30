require 'test_helper'

class WrecksControllerTest < ActionController::TestCase
  setup do
    @wreck = wrecks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wrecks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wreck" do
    assert_difference('Wreck.count') do
      post :create, wreck: { is_boring: @wreck.is_boring, is_epic: @wreck.is_epic, is_spectacular: @wreck.is_spectacular, message: @wreck.message }
    end

    assert_redirected_to wreck_path(assigns(:wreck))
  end

  test "should show wreck" do
    get :show, id: @wreck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wreck
    assert_response :success
  end

  test "should update wreck" do
    patch :update, id: @wreck, wreck: { is_boring: @wreck.is_boring, is_epic: @wreck.is_epic, is_spectacular: @wreck.is_spectacular, message: @wreck.message }
    assert_redirected_to wreck_path(assigns(:wreck))
  end

  test "should destroy wreck" do
    assert_difference('Wreck.count', -1) do
      delete :destroy, id: @wreck
    end

    assert_redirected_to wrecks_path
  end
end
