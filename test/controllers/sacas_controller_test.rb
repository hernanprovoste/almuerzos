require 'test_helper'

class SacasControllerTest < ActionController::TestCase
  setup do
    @saca = sacas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sacas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saca" do
    assert_difference('Saca.count') do
      post :create, saca: { fecha: @saca.fecha, persona_id: @saca.persona_id }
    end

    assert_redirected_to saca_path(assigns(:saca))
  end

  test "should show saca" do
    get :show, id: @saca
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @saca
    assert_response :success
  end

  test "should update saca" do
    patch :update, id: @saca, saca: { fecha: @saca.fecha, persona_id: @saca.persona_id }
    assert_redirected_to saca_path(assigns(:saca))
  end

  test "should destroy saca" do
    assert_difference('Saca.count', -1) do
      delete :destroy, id: @saca
    end

    assert_redirected_to sacas_path
  end
end
