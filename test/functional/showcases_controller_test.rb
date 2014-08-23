require 'test_helper'

class ShowcasesControllerTest < ActionController::TestCase
  setup do
    @showcase = showcases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:showcases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create showcase" do
    assert_difference('Showcase.count') do
      post :create, showcase: { description: @showcase.description, id: @showcase.id, likes: @showcase.likes, picture: @showcase.picture, upload_date: @showcase.upload_date, visits: @showcase.visits }
    end

    assert_redirected_to showcase_path(assigns(:showcase))
  end

  test "should show showcase" do
    get :show, id: @showcase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @showcase
    assert_response :success
  end

  test "should update showcase" do
    put :update, id: @showcase, showcase: { description: @showcase.description, id: @showcase.id, likes: @showcase.likes, picture: @showcase.picture, upload_date: @showcase.upload_date, visits: @showcase.visits }
    assert_redirected_to showcase_path(assigns(:showcase))
  end

  test "should destroy showcase" do
    assert_difference('Showcase.count', -1) do
      delete :destroy, id: @showcase
    end

    assert_redirected_to showcases_path
  end
end
