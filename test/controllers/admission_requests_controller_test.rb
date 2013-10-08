require 'test_helper'

class AdmissionRequestsControllerTest < ActionController::TestCase
  setup do
    @admission_request = admission_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admission_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admission_request" do
    assert_difference('AdmissionRequest.count') do
      post :create, admission_request: { best_thing_ever: @admission_request.best_thing_ever, find_about_cf: @admission_request.find_about_cf, phone_number: @admission_request.phone_number, previous_programming_exp: @admission_request.previous_programming_exp, user_id: @admission_request.user_id, why_join: @admission_request.why_join }
    end

    assert_redirected_to admission_request_path(assigns(:admission_request))
  end

  test "should show admission_request" do
    get :show, id: @admission_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admission_request
    assert_response :success
  end

  test "should update admission_request" do
    patch :update, id: @admission_request, admission_request: { best_thing_ever: @admission_request.best_thing_ever, find_about_cf: @admission_request.find_about_cf, phone_number: @admission_request.phone_number, previous_programming_exp: @admission_request.previous_programming_exp, user_id: @admission_request.user_id, why_join: @admission_request.why_join }
    assert_redirected_to admission_request_path(assigns(:admission_request))
  end

  test "should destroy admission_request" do
    assert_difference('AdmissionRequest.count', -1) do
      delete :destroy, id: @admission_request
    end

    assert_redirected_to admission_requests_path
  end
end
