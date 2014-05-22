require 'test_helper'

class ExplosivesControllerTest < ActionController::TestCase
  setup do
    @explosife = explosives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:explosives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create explosife" do
    assert_difference('Explosive.count') do
      post :create, explosife: { descripcion_incidente: @explosife.descripcion_incidente, emergency_id: @explosife.emergency_id, fecha: @explosife.fecha, hora_incidente: @explosife.hora_incidente, jefe_brigada: @explosife.jefe_brigada, jefe_seguridad: @explosife.jefe_seguridad, lugar_incidente: @explosife.lugar_incidente, material_utilizado: @explosife.material_utilizado, numero_caso: @explosife.numero_caso, observaciones_incidente: @explosife.observaciones_incidente }
    end

    assert_redirected_to explosife_path(assigns(:explosife))
  end

  test "should show explosife" do
    get :show, id: @explosife
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @explosife
    assert_response :success
  end

  test "should update explosife" do
    patch :update, id: @explosife, explosife: { descripcion_incidente: @explosife.descripcion_incidente, emergency_id: @explosife.emergency_id, fecha: @explosife.fecha, hora_incidente: @explosife.hora_incidente, jefe_brigada: @explosife.jefe_brigada, jefe_seguridad: @explosife.jefe_seguridad, lugar_incidente: @explosife.lugar_incidente, material_utilizado: @explosife.material_utilizado, numero_caso: @explosife.numero_caso, observaciones_incidente: @explosife.observaciones_incidente }
    assert_redirected_to explosife_path(assigns(:explosife))
  end

  test "should destroy explosife" do
    assert_difference('Explosive.count', -1) do
      delete :destroy, id: @explosife
    end

    assert_redirected_to explosives_path
  end
end
