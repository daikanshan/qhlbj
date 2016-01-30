require 'test_helper'

class Admin::CulturesControllerTest < ActionController::TestCase
  setup do
    @admin_culture = admin_cultures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_cultures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_culture" do
    assert_difference('Admin::Culture.count') do
      post :create, admin_culture: { content: @admin_culture.content, title: @admin_culture.title }
    end

    assert_redirected_to admin_culture_path(assigns(:admin_culture))
  end

  test "should show admin_culture" do
    get :show, id: @admin_culture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_culture
    assert_response :success
  end

  test "should update admin_culture" do
    patch :update, id: @admin_culture, admin_culture: { content: @admin_culture.content, title: @admin_culture.title }
    assert_redirected_to admin_culture_path(assigns(:admin_culture))
  end

  test "should destroy admin_culture" do
    assert_difference('Admin::Culture.count', -1) do
      delete :destroy, id: @admin_culture
    end

    assert_redirected_to admin_cultures_path
  end
end
