require 'test_helper'

class InstitutionListsControllerTest < ActionController::TestCase
  setup do
    @institution_list = institution_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:institution_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create institution_list" do
    assert_difference('InstitutionList.count') do
      post :create, institution_list: { nombre: @institution_list.nombre, sigla: @institution_list.sigla }
    end

    assert_redirected_to institution_list_path(assigns(:institution_list))
  end

  test "should show institution_list" do
    get :show, id: @institution_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @institution_list
    assert_response :success
  end

  test "should update institution_list" do
    patch :update, id: @institution_list, institution_list: { nombre: @institution_list.nombre, sigla: @institution_list.sigla }
    assert_redirected_to institution_list_path(assigns(:institution_list))
  end

  test "should destroy institution_list" do
    assert_difference('InstitutionList.count', -1) do
      delete :destroy, id: @institution_list
    end

    assert_redirected_to institution_lists_path
  end
end
