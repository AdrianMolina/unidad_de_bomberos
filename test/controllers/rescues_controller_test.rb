require 'test_helper'

class RescuesControllerTest < ActionController::TestCase
  setup do
    @rescue = rescues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rescues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rescue" do
    assert_difference('Rescue.count') do
      post :create, rescue: { danos_materiales: @rescue.danos_materiales, descripcion_incidente: @rescue.descripcion_incidente, emergency_id: @rescue.emergency_id, hora_incidente: @rescue.hora_incidente, jefe_brigada: @rescue.jefe_brigada, jefe_seguridad: @rescue.jefe_seguridad, latitude: @rescue.latitude, longitude: @rescue.longitude, lugar_incidente: @rescue.lugar_incidente, numero_caso: @rescue.numero_caso, observaciones: @rescue.observaciones }
    end

    assert_redirected_to rescue_path(assigns(:rescue))
  end

  test "should show rescue" do
    get :show, id: @rescue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rescue
    assert_response :success
  end

  test "should update rescue" do
    patch :update, id: @rescue, rescue: { danos_materiales: @rescue.danos_materiales, descripcion_incidente: @rescue.descripcion_incidente, emergency_id: @rescue.emergency_id, hora_incidente: @rescue.hora_incidente, jefe_brigada: @rescue.jefe_brigada, jefe_seguridad: @rescue.jefe_seguridad, latitude: @rescue.latitude, longitude: @rescue.longitude, lugar_incidente: @rescue.lugar_incidente, numero_caso: @rescue.numero_caso, observaciones: @rescue.observaciones }
    assert_redirected_to rescue_path(assigns(:rescue))
  end

  test "should destroy rescue" do
    assert_difference('Rescue.count', -1) do
      delete :destroy, id: @rescue
    end

    assert_redirected_to rescues_path
  end
end
