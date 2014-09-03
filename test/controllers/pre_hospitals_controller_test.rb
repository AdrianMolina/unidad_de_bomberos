require 'test_helper'

class PreHospitalsControllerTest < ActionController::TestCase
  setup do
    @pre_hospital = pre_hospitals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pre_hospitals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pre_hospital" do
    assert_difference('PreHospital.count') do
      post :create, pre_hospital: { accidente_vehicular: @pre_hospital.accidente_vehicular, desarrollo_atencion: @pre_hospital.desarrollo_atencion, diagnostico: @pre_hospital.diagnostico, emergency_id: @pre_hospital.emergency_id, hora_incidente: @pre_hospital.hora_incidente, numero_caso: @pre_hospital.numero_caso, peritaje_vehicular: @pre_hospital.peritaje_vehicular, pertenencias_victima: @pre_hospital.pertenencias_victima, prioridad_traslado: @pre_hospital.prioridad_traslado, trauma: @pre_hospital.trauma }
    end

    assert_redirected_to pre_hospital_path(assigns(:pre_hospital))
  end

  test "should show pre_hospital" do
    get :show, id: @pre_hospital
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pre_hospital
    assert_response :success
  end

  test "should update pre_hospital" do
    patch :update, id: @pre_hospital, pre_hospital: { accidente_vehicular: @pre_hospital.accidente_vehicular, desarrollo_atencion: @pre_hospital.desarrollo_atencion, diagnostico: @pre_hospital.diagnostico, emergency_id: @pre_hospital.emergency_id, hora_incidente: @pre_hospital.hora_incidente, numero_caso: @pre_hospital.numero_caso, peritaje_vehicular: @pre_hospital.peritaje_vehicular, pertenencias_victima: @pre_hospital.pertenencias_victima, prioridad_traslado: @pre_hospital.prioridad_traslado, trauma: @pre_hospital.trauma }
    assert_redirected_to pre_hospital_path(assigns(:pre_hospital))
  end

  test "should destroy pre_hospital" do
    assert_difference('PreHospital.count', -1) do
      delete :destroy, id: @pre_hospital
    end

    assert_redirected_to pre_hospitals_path
  end
end
