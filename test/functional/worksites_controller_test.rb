require 'test_helper'

class WorksitesControllerTest < ActionController::TestCase
  setup do
    @worksite = worksites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worksites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worksite" do
    assert_difference('Worksite.count') do
      post :create, worksite: { address: @worksite.address, description: @worksite.description, latitude: @worksite.latitude, longitude: @worksite.longitude, title: @worksite.title }
    end

    assert_redirected_to worksite_path(assigns(:worksite))
  end

  test "should show worksite" do
    get :show, id: @worksite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worksite
    assert_response :success
  end

  test "should update worksite" do
    put :update, id: @worksite, worksite: { address: @worksite.address, description: @worksite.description, latitude: @worksite.latitude, longitude: @worksite.longitude, title: @worksite.title }
    assert_redirected_to worksite_path(assigns(:worksite))
  end

  test "should destroy worksite" do
    assert_difference('Worksite.count', -1) do
      delete :destroy, id: @worksite
    end

    assert_redirected_to worksites_path
  end
end
