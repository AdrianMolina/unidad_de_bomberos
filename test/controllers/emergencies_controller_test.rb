require 'test_helper'

class EmergenciesControllerTest < ActionController::TestCase
  setup do
    @emergency = emergencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emergencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emergency" do
    assert_difference('Emergency.count') do
      post :create, emergency: { denunciante: @emergency.denunciante, despachador: @emergency.despachador, hora_salida: @emergency.hora_salida, lugar: @emergency.lugar, numero_caso: @emergency.numero_caso, observacion: @emergency.observacion, referencia_lugar: @emergency.referencia_lugar, sigla_vehiculo: @emergency.sigla_vehiculo, telefono_denunciante: @emergency.telefono_denunciante, tipo: @emergency.tipo }
    end

    assert_redirected_to emergency_path(assigns(:emergency))
  end

  test "should show emergency" do
    get :show, id: @emergency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emergency
    assert_response :success
  end

  test "should update emergency" do
    patch :update, id: @emergency, emergency: { denunciante: @emergency.denunciante, despachador: @emergency.despachador, hora_salida: @emergency.hora_salida, lugar: @emergency.lugar, numero_caso: @emergency.numero_caso, observacion: @emergency.observacion, referencia_lugar: @emergency.referencia_lugar, sigla_vehiculo: @emergency.sigla_vehiculo, telefono_denunciante: @emergency.telefono_denunciante, tipo: @emergency.tipo }
    assert_redirected_to emergency_path(assigns(:emergency))
  end

  test "should destroy emergency" do
    assert_difference('Emergency.count', -1) do
      delete :destroy, id: @emergency
    end

    assert_redirected_to emergencies_path
  end
end
