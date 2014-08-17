require 'test_helper'

class FiresControllerTest < ActionController::TestCase
  setup do
    @fire = fires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fire" do
    assert_difference('Fire.count') do
      post :create, fire: { descripcion_incidente: @fire.descripcion_incidente, emergency_id: @fire.emergency_id, hora_incidente: @fire.hora_incidente, jefe_brigada: @fire.jefe_brigada, jefe_seguridad: @fire.jefe_seguridad, latitude: @fire.latitude, longitude: @fire.longitude, lugar_incidente: @fire.lugar_incidente, numero_caso: @fire.numero_caso }
    end

    assert_redirected_to fire_path(assigns(:fire))
  end

  test "should show fire" do
    get :show, id: @fire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fire
    assert_response :success
  end

  test "should update fire" do
    patch :update, id: @fire, fire: { descripcion_incidente: @fire.descripcion_incidente, emergency_id: @fire.emergency_id, hora_incidente: @fire.hora_incidente, jefe_brigada: @fire.jefe_brigada, jefe_seguridad: @fire.jefe_seguridad, latitude: @fire.latitude, longitude: @fire.longitude, lugar_incidente: @fire.lugar_incidente, numero_caso: @fire.numero_caso }
    assert_redirected_to fire_path(assigns(:fire))
  end

  test "should destroy fire" do
    assert_difference('Fire.count', -1) do
      delete :destroy, id: @fire
    end

    assert_redirected_to fires_path
  end
end
