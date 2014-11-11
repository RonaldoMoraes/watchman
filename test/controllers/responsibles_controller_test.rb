require 'test_helper'

class ResponsiblesControllerTest < ActionController::TestCase
  setup do
    @responsible = responsibles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:responsibles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create responsible" do
    assert_difference('Responsible.count') do
      post :create, responsible: { email: @responsible.email, name: @responsible.name }
    end

    assert_redirected_to responsible_path(assigns(:responsible))
  end

  test "should show responsible" do
    get :show, id: @responsible
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @responsible
    assert_response :success
  end

  test "should update responsible" do
    patch :update, id: @responsible, responsible: { email: @responsible.email, name: @responsible.name }
    assert_redirected_to responsible_path(assigns(:responsible))
  end

  test "should destroy responsible" do
    assert_difference('Responsible.count', -1) do
      delete :destroy, id: @responsible
    end

    assert_redirected_to responsibles_path
  end
end
