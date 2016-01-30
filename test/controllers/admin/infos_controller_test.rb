require 'test_helper'

class Admin::InfosControllerTest < ActionController::TestCase
  setup do
    @admin_info = admin_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_info" do
    assert_difference('Admin::Info.count') do
      post :create, admin_info: { content: @admin_info.content, title: @admin_info.title }
    end

    assert_redirected_to admin_info_path(assigns(:admin_info))
  end

  test "should show admin_info" do
    get :show, id: @admin_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_info
    assert_response :success
  end

  test "should update admin_info" do
    patch :update, id: @admin_info, admin_info: { content: @admin_info.content, title: @admin_info.title }
    assert_redirected_to admin_info_path(assigns(:admin_info))
  end

  test "should destroy admin_info" do
    assert_difference('Admin::Info.count', -1) do
      delete :destroy, id: @admin_info
    end

    assert_redirected_to admin_infos_path
  end
end
