require 'test_helper'

class SoilSamplesControllerTest < ActionController::TestCase
  setup do
    @soil_sample = soil_samples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soil_samples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soil_sample" do
    assert_difference('SoilSample.count') do
      post :create, soil_sample: {  }
    end

    assert_redirected_to soil_sample_path(assigns(:soil_sample))
  end

  test "should show soil_sample" do
    get :show, id: @soil_sample
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soil_sample
    assert_response :success
  end

  test "should update soil_sample" do
    put :update, id: @soil_sample, soil_sample: {  }
    assert_redirected_to soil_sample_path(assigns(:soil_sample))
  end

  test "should destroy soil_sample" do
    assert_difference('SoilSample.count', -1) do
      delete :destroy, id: @soil_sample
    end

    assert_redirected_to soil_samples_path
  end
end
