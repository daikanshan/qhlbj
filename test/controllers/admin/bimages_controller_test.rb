require 'test_helper'

class Admin::BimagesControllerTest < ActionController::TestCase
  setup do
    @admin_bimage = admin_bimages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_bimages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_bimage" do
    assert_difference('Admin::Bimage.count') do
      post :create, admin_bimage: { abstract: @admin_bimage.abstract, avatar: @admin_bimage.avatar, shown: @admin_bimage.shown, title: @admin_bimage.title }
    end

    assert_redirected_to admin_bimage_path(assigns(:admin_bimage))
  end

  test "should show admin_bimage" do
    get :show, id: @admin_bimage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_bimage
    assert_response :success
  end

  test "should update admin_bimage" do
    patch :update, id: @admin_bimage, admin_bimage: { abstract: @admin_bimage.abstract, avatar: @admin_bimage.avatar, shown: @admin_bimage.shown, title: @admin_bimage.title }
    assert_redirected_to admin_bimage_path(assigns(:admin_bimage))
  end

  test "should destroy admin_bimage" do
    assert_difference('Admin::Bimage.count', -1) do
      delete :destroy, id: @admin_bimage
    end

    assert_redirected_to admin_bimages_path
  end
end
